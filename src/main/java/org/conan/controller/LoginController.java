package org.conan.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.conan.domain.MemberVO2;
import org.conan.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
public class LoginController {
@Autowired
MemberService service;
@RequestMapping(value = "/update", method = RequestMethod.GET)
public void Update() {
	log.info("�뾽�뜲�씠�듃 �럹�씠吏�");
}
@RequestMapping(value = "/UpdateProc" , method = RequestMethod.POST)
public String UpdateProc(MemberVO2 vo,HttpServletRequest request) {
	log.info("vo"+vo);
	service.Update(vo);
	return null;
}
@GetMapping("/join")
public void Join() {
	log.info("회원가입페이지");
}
@GetMapping("/joinProc")
public void join() {}
@RequestMapping(value = "/joinProc", method = RequestMethod.POST)
public String joinProc(MemberVO2 vo)throws Exception {
	log.info(vo);
	service.register(vo);
	return "redirect:/main";
}
@GetMapping("/main")
public void main() {
	log.info("메인화면");
}
@GetMapping("/login")
public void login() {
	log.info("로그인페이지");
}
@PostMapping("/loginProc")
public String loginProc(HttpServletRequest request,  MemberVO2 vo, RedirectAttributes rttr) {
	log.info("loginProc!!");
	log.info(vo);
	HttpSession session = request.getSession();
	MemberVO2 lvo = service.login(vo); //lvo 揶쏅�れ뱽筌띾슢諭억옙堉긴빳�꼷苑� �룯�뜃由곤옙�넅 占쎈뻻占쎄땀
    if(lvo == null) {                                // 占쎌뵬燁살꼹釉�筌욑옙 占쎈륫占쎈뮉 占쎈툡占쎌뵠占쎈탵, �뜮袁⑨옙甕곕뜇�깈 占쎌뿯占쎌젾 野껋럩�뒭
        
        int result = 0;
        rttr.addFlashAttribute("result", result);
        return "redirect:/login";
        
    }
    
    session.setAttribute("member", lvo);             // 占쎌뵬燁살꼹釉�占쎈뮉 占쎈툡占쎌뵠占쎈탵, �뜮袁⑨옙甕곕뜇�깈 野껋럩�뒭 (嚥≪뮄�젃占쎌뵥 占쎄쉐�⑨옙)
    
    return "redirect:/main";
	
}
@PostMapping("/logout")
public String logout(HttpServletRequest request) {
	log.info("로그아웃!");
	HttpSession session = request.getSession();
	session.invalidate();
	return "redirect:/main";
}
@GetMapping("/test")
public String test(HttpSession session) {
	String id = (String)session.getAttribute("name");
	return null;
}
@RequestMapping(value = "/Idcheck", method = RequestMethod.POST)
@ResponseBody
public String Idcheck(String id) {
	log.info("아이디체크");
	int result = service.Idcheck(id);
	log.info("결과는?? :" + result);
	if(result!=0) {
		return "fail";
				
	}else {
		return "success";
	}
}
}
