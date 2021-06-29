package org.conan.service;

import org.conan.domain.IngreVO;

public interface LikeService {
	
    public int getBoardLike(IngreVO vo);
    public void insertBoardLike(IngreVO vo);
    public void deleteBoardLike(IngreVO vo);
    public void updateBoardLike(int rid);
	


}
