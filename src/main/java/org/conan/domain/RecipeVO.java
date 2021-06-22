package org.conan.domain;

import java.util.Date;//���߿� ���� ����� sql�� ����Ʈ �غ���
import java.util.List;

import lombok.Data;

@Data
public class RecipeVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
}
