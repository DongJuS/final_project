package org.conan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.conan.domain.Criteria;
import org.conan.domain.IngreVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;

public interface RecipeMapper {
	/* @Select("select * from tbl_board where bno>0") */
	public List<RecipeVO> getList();
	public void insert(RecipeVO board);
	public void insertSelectKey(RecipeVO board);
	
	public int delete(Long bno);
	public int update(RecipeVO board);

	/* public List<RecipeVO> getListWithPaging(Criteria cri); */
	public int getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno")Long no, @Param("amount")int amount);
	public RecipeVO read(Long bno);
	public List<IngreVO> read1(Long rid);
	public List<ProceVO> read2(Long rid);
}
