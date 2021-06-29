package org.conan.mapper;

import org.conan.domain.IngreVO;

public interface LikeMapper {

	public int getBoardLike(IngreVO vo);
	public void insertSelectKey(IngreVO vo);
	public void deleteBoardLike(IngreVO vo);
	public void updateBoardLike(int rid);
	
	

}
