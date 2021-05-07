package ino.web.freeBoard.controller;

import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.service.FreeBoardService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;

	@RequestMapping("/main.ino")
	public ModelAndView main(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<FreeBoardDto> list = freeBoardService.freeBoardList();

		mav.setViewName("boardMain");
		mav.addObject("freeBoardList",list);
		return mav;
	}

	@RequestMapping("/freeBoardInsert.ino")
	public String freeBoardInsert(){
		return "freeBoardInsert";
	}

	@RequestMapping("/freeBoardInsertPro.ino")
	@ResponseBody
	public Map<String, Object> freeBoardInsertPro(HttpServletRequest request, @RequestParam Map<String, Object> iMap){
		iMap = freeBoardService.freeBoardInsertPro(iMap);
		return iMap;
	}

	@RequestMapping("/freeBoardDetail.ino")
	@ResponseBody
	public ModelAndView freeBoardDetail(HttpServletRequest request){
		int num = Integer.parseInt(request.getParameter("num"));
		Map<String, Object> dMap = new HashMap<String, Object>();
		dMap = freeBoardService.getDetailByNum(num);
		System.err.println(dMap);
		return new ModelAndView("freeBoardDetail", "freeBoardOne", dMap);
	}

	@RequestMapping("/freeBoardModify.ino")
	public String freeBoardModify(HttpServletRequest request, FreeBoardDto dto){
		return "redirect:/main.ino";
	}


	@RequestMapping("/freeBoardDelete.ino")
	public String FreeBoardDelete(int num){
		return "redirect:/main.ino";
	}
}