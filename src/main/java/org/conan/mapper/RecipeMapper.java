package org.conan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;
import org.conan.domain.RecipeVO;

public interface RecipeMapper {
	/* @Select("select * from tbl_board where bno>0") */
	public List<RecipeVO> getList();
	public void insert(RecipeVO board);
	public void insertSelectKey(RecipeVO board);
	public RecipeVO read(Long bno);
	public int delete(Long bno);
	public int update(RecipeVO board);

	/* public List<RecipeVO> getListWithPaging(Criteria cri); */
	public int getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno")Long no, @Param("amount")int amount);
}
