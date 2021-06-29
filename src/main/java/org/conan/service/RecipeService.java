package org.conan.service;

import java.util.List;

import org.conan.domain.BoardAttachVO;
import org.conan.domain.Criteria;
import org.conan.domain.IngreVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;

public interface RecipeService {
	public void register(RecipeVO board);
	public RecipeVO get(Long rid);
	public boolean modify(RecipeVO board);
	public boolean remove(Long rid);
	public List<RecipeVO> getList();

	/* public List<RecipeVO> getList(Criteria cri); */
	public int getTotal(Criteria cri);
	List<BoardAttachVO> getAttachList(Long rid);
	public boolean deleteAll(Long rid);
	public List<IngreVO> get1(Long rid);
	public List<ProceVO> get2(Long rid);

}
