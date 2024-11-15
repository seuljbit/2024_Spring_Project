package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.domain.LPVO;
import com.ezen.spring.domain.PagingVO;

public interface LPService {

	List<LPVO> getLpList(PagingVO pgvo);

	LPVO getLpById(int lpId);
	
}
