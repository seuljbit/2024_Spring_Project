package com.ezen.spring.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.FileVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.handler.FileHandler;
import com.ezen.spring.handler.PagingHandler;
import com.ezen.spring.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board/*")
@Controller
public class BoardController {

    private final BoardService bsv;
    private final FileHandler fh;

    @GetMapping("/register")
    public void register() {}

    @PostMapping("/insert")
    public String insert(BoardVO bvo, MultipartFile[] files) {
        log.info(">>> insert bvo > {}", bvo);
        List<FileVO> flist = null;

        if (files[0].getSize() > 0) {
            flist = fh.uploadFiles(files);
            log.info(">>>>> flist > {}", flist);
        }

        BoardDTO bdto = new BoardDTO(bvo, flist);
        int isOk = bsv.insert(bdto);
        log.info(">>>> insert > {}", isOk > 0 ? "OK" : "Fail");
        return "redirect:/";
    }

    @GetMapping("/list")
    public String list(Model m, PagingVO pgvo) {
        List<BoardDTO> boardList = bsv.getBoardDTOList(pgvo); // BoardDTO 리스트를 가져옴

        LocalDate today = LocalDate.now();
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        boardList.forEach(bdto -> {
            BoardVO bvo = bdto.getBvo();
            try {
                // 날짜 포맷 처리
                LocalDateTime regDate = LocalDateTime.parse(bvo.getRegDate(), dateTimeFormatter);
                if (regDate.toLocalDate().isEqual(today)) {
                    // 오늘이면 시간만 표시
                    bvo.setRegDate(regDate.format(timeFormatter));
                } else {
                    // 오늘이 아니면 날짜만 표시
                    bvo.setRegDate(regDate.format(dateFormatter));
                }

                // 썸네일 경로 설정
                if (bvo.getHasFile() > 0 && bdto.getFlist() != null && !bdto.getFlist().isEmpty()) {
                    FileVO fileVO = bdto.getFlist().get(0); // 첫 번째 파일을 썸네일로 사용
                    String saveDir = fileVO.getSaveDir().replace("\\", "/");
                    bvo.setThumbnailPath("/upload/" + saveDir + "/" + fileVO.getUuid() + "_th_" + fileVO.getFileName());
                } else {
                    bvo.setThumbnailPath("/resources/image/lp.png");
                }

            } catch (Exception e) {
                log.error("Date parsing error for regDate: {}", bvo.getRegDate(), e);
            }
        });

        int totalCount = bsv.getTotal(pgvo);
        PagingHandler ph = new PagingHandler(totalCount, pgvo);
        log.info(">>> totalCount > {}", totalCount);
        m.addAttribute("list", boardList);
        m.addAttribute("ph", ph);
        return "/board/list";
    }

    @GetMapping({"/detail", "/modify"})
    public void detail(int bno, Model m, HttpServletRequest request) {
        String path = request.getServletPath();
        log.info(">>>>>>>>>>>>>>>>>>>> path > {} ", path);
        if (path.equals("/board/detail")) {
            bsv.readCountUp(bno);
        }
        BoardDTO bdto = bsv.getDetail(bno);
        m.addAttribute("bdto", bdto);
    }

    @PostMapping("/update")
    public String update(BoardVO bvo, @RequestParam(name = "files", required = false) MultipartFile[] files) {
        List<FileVO> flist = null;

        if (files != null && files[0].getSize() > 0) {
            flist = fh.uploadFiles(files);
        }
        int isOk = bsv.modify(new BoardDTO(bvo, flist));
        log.info(">>>> update > {}", isOk > 0 ? "OK" : "Fail");
        return "redirect:/board/detail?bno=" + bvo.getBno();
    }

    @GetMapping("/delete")
    public String delete(int bno) {
        int isOk = bsv.delete(bno);
        log.info(">>>> delete > {}", isOk > 0 ? "OK" : "Fail");
        return "redirect:/board/list";
    }

    @ResponseBody
    @DeleteMapping("/file/{uuid}")
    public String fileDelete(@PathVariable("uuid") String uuid) {
        int isOk = bsv.removeFile(uuid);
        return isOk > 0 ? "1" : "0";
    }

}