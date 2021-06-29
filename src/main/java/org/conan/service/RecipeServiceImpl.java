package org.conan.service;

import java.util.List;

import org.conan.domain.BoardAttachVO;
import org.conan.domain.Criteria;
import org.conan.domain.IngreVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;
import org.conan.mapper.BoardAttachMapper;
import org.conan.mapper.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class RecipeServiceImpl implements RecipeService {
	@Setter(onMethod_=@Autowired)
	private RecipeMapper mapper;
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(RecipeVO board) {
		log.info("register........."+board.getRid());
		mapper.insertSelectKey(board);
		if(board.getAttachList()==null || board.getAttachList().size()<=0) {
			return;
		}
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getRid());
			attachMapper.insert(attach);
		});

	}

	@Override
	public RecipeVO get(Long rid) {
		log.info("get........"+rid);
		return mapper.read(rid);
	}
	@Transactional
	@Override
	public boolean modify(RecipeVO board) {
		log.info("modify............"+board);
		attachMapper.deleteAll(board.getRid());//db에서 모든 첨부파일 정보 삭제
		boolean modifyResult= mapper.update(board)==1;//board테이블 정보 수정
		if(modifyResult&&board.getAttachList()!=null&&board.getAttachList().size()>0) {
			board.getAttachList().forEach(attach->{
				attach.setBno(board.getRid());
				attachMapper.insert(attach);//db에 첨부파일 정보 저장
			});
		}
		return modifyResult;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove..............."+bno);
		return mapper.delete(bno)==1;
	}

	@Override
	public List<RecipeVO> getList() {
		log.info("getList.............................");
		return mapper.getList();
	}
	@Override
	public List<IngreVO> get1(Long rid) {
		// TODO Auto-generated method stub
		return mapper.read1(rid);
	}
	@Override
	public List<ProceVO> get2(Long rid) {
		// TODO Auto-generated method stub
		return mapper.read2(rid);
	}
	
	
	/*
	 * @Override public List<RecipeVO> getList(Criteria cri){
	 * log.info("getList with criteria : "+cri); return
	 * mapper.getListWithPaging(cri); }
	 */
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<BoardAttachVO>getAttachList(Long rid){
		log.info("get Attach list by bno" + rid);
		return attachMapper.findByBno(rid);
	}
	@Transactional
	@Override
	public boolean deleteAll(Long bno) {
		log.info("remove..............."+bno);
		attachMapper.deleteAll(bno);
		return mapper.delete(bno)==1;
	}
	

}
