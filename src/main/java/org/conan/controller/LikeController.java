package org.conan.controller;

import javax.servlet.http.HttpServletRequest;

import org.conan.domain.IngreVO;
import org.conan.service.LikeService;
import org.conan.service.RecipeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/include/*")
@AllArgsConstructor
public class LikeController {
	private RecipeService Re_service;
	private LikeService service;
	
	
    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("Rid") int Rid, Model model,
                   
                     @ModelAttribute("category") String category,
                     HttpServletRequest httpRequest) throws Exception {

//        service.increaseViewcnt(Rid, category);
//
//        model.addAttribute(service.readBoard(Rid, category));

        int userid = ((IngreVO) httpRequest.getSession().getAttribute("login")).getT_id();

        IngreVO vo = new IngreVO();
        vo.setRid(Rid);
        vo.setT_id(userid);

        int boardlike = service.getBoardLike(vo);
        System.out.println(boardlike);

        model.addAttribute("heart",boardlike);
    }

   @ResponseBody
    @RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
    public int heart(HttpServletRequest httpRequest) throws Exception {

        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int boardId = Integer.parseInt(httpRequest.getParameter("boardId"));
        int userid = ((IngreVO) httpRequest.getSession().getAttribute("login")).getT_id();

        IngreVO boardLikeVO = new IngreVO();

        boardLikeVO.setRid(boardId);
        boardLikeVO.setT_id(userid);

        System.out.println(heart);

        if(heart >= 1) {
            service.deleteBoardLike(boardLikeVO);
            heart=0;
        } else {
            service.insertBoardLike(boardLikeVO);
            heart=1;
        }

        return heart;

    }

	

}
