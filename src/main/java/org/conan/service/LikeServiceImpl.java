package org.conan.service;

import org.conan.domain.IngreVO;
import org.conan.mapper.LikeMapper;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class LikeServiceImpl implements LikeService {

	private LikeMapper mapper;
	
	 @Override
	    public void insertBoardLike(IngreVO vo) {
		 mapper.insertSelectKey(vo);
		 mapper.updateBoardLike(vo.getRid());
	    }

	    @Override
	    public void deleteBoardLike(IngreVO vo) {
	    	mapper.deleteBoardLike(vo);
	    	mapper.updateBoardLike(vo.getRid());
	    }
	    
	    @Override
	    public  int getBoardLike(IngreVO vo) {
	            return mapper.getBoardLike(vo);
	    }

		@Override
		public void updateBoardLike(int rid) {
			// TODO Auto-generated method stub
			
		}

}
