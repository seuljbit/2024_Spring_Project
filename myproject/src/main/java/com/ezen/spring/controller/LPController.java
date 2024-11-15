package com.ezen.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.ezen.spring.domain.LPVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.service.LPService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/vinyl/*")
@Controller
public class LPController {
	private final LPService lpService;
	 
	@GetMapping("/")
	public String sale() {
	    return "vinyl/sale";
	}
	 
	@GetMapping("/sale")
	public String sale(Model model, PagingVO pgvo) {
	    List<LPVO> lpAlbums = lpService.getLpList(pgvo);
	    model.addAttribute("lpAlbums", lpAlbums);
	    return "vinyl/sale"; // "WEB-INF/views/vinyl/sale.jsp"로 설정
	}
	
	@GetMapping("/detail")
	public String getDetail(@RequestParam("lpId") int lpId, Model model) {
	    LPVO lp = lpService.getLpById(lpId); // 서비스에서 lpId에 해당하는 데이터를 가져온다고 가정
	    model.addAttribute("lp", lp);
	    return "vinyl/detail"; // detail.jsp 뷰를 반환
	}
	
	

}
