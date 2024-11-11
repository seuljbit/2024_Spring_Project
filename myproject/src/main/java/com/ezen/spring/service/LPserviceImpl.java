package com.ezen.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.spring.dao.LpDAO;
import com.ezen.spring.domain.LPVO;
import com.ezen.spring.domain.PagingVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class LPserviceImpl implements LPService {

	private final LpDAO lpdao;

//	@Override
//	public List<LPVO> getLpList() {
//	    return lpdao.getLpList();
//	}

	@Override
	public List<LPVO> getLpList(PagingVO pgvo) {
	    return lpdao.getLpList(pgvo);
	}
	
	@Override
	public LPVO getLpById(int lpId) {
	    return lpdao.getLpById(lpId);
	}



}
