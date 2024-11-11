package com.ezen.spring.dao;

import java.util.List;

import com.ezen.spring.domain.LPVO;
import com.ezen.spring.domain.PagingVO;

public interface LpDAO {
	
	List<LPVO> getLpList(PagingVO pgvo);

	LPVO getLpById(int lpId);


}
