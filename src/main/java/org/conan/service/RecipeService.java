package org.conan.service;

import java.util.List;

import org.conan.domain.BoardAttachVO;
import org.conan.domain.Criteria;
import org.conan.domain.RecipeVO;

public interface RecipeService {
	public void register(RecipeVO board);
	public RecipeVO get(Long bno);
	public boolean modify(RecipeVO board);
	public boolean remove(Long bno);
	public List<RecipeVO> getList();

	/* public List<RecipeVO> getList(Criteria cri); */
	public int getTotal(Criteria cri);
	List<BoardAttachVO> getAttachList(Long bno);
	public boolean deleteAll(Long bno);

}
