package org.conan.domain;

import java.util.List;

import lombok.Data;

@Data
public class RecipeVO {
	private Long rid;
	private String name;
	private String img;
	private String summary;
	
	private List<BoardAttachVO> attachList;
}
