package org.conan.controller;


import org.conan.domain.Criteria;
import org.conan.domain.PageDTO;
import org.conan.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sample/*")
@AllArgsConstructor
public class SampleController {
	private BoardService service;
	
	@GetMapping("/all")
	public void doAll() {
		log.info("logined all");

	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("logined member");

	}

	
	@GetMapping("/admin")
	public void doadmin() {
		log.info("logined admin");

	}
@GetMapping("/annoMember")
	public void doMember2() {
		log.info("어노테이션 멤버로 로그인");
	}
	@GetMapping("/annoAdmin")
	public void doAdmin2() {
		log.info("어노테이션 어드민민");
	}
}
