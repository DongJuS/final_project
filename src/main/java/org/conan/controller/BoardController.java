package org.conan.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.conan.domain.BoardAttachVO;
import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;
import org.conan.domain.PageDTO;
import org.conan.service.BoardService;
import org.conan.service.BoardService2;
import org.conan.service.RecipeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	private BoardService2 service2;
	private RecipeService Re_service;
	
	@GetMapping("/list") 
	public void list(Criteria cri, Model model) {
		log.info("list : "+cri);
		model.addAttribute("list", service.getList(cri));
		int total=service.getTotal(cri);
		log.info("total : "+ total);	
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	@GetMapping("/list2")
	public void list2(Criteria cri, Model model) {
		log.info("list2");
//		model.addAttribute("list2",service2.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
	}
	@GetMapping("/main")
	public void main(Criteria cri, Model model) {
		 model.addAttribute("list", Re_service.getList()); 
		log.info("종인이 형꺼?");
		int total=Re_service.getTotal(cri);
		log.info("total : "+ total);	
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	 
	
	
	
	@GetMapping("/get_reci")
	public void get_reci(@RequestParam("rid") Long rid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify");
	
//		model.addAttribute("recipe",Re_service.get(rid));
//		model.addAttribute("ingre", Re_service.get1(rid));
//		model.addAttribute("proce", Re_service.get2(rid));
	}
	


	

}
