package com.student.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.student.admin.service.AdminService;
import com.student.admin.vo.GradeVO;
import com.student.member.vo.MemberVO;

@Controller("adminController")
public class AdminControllerImpl implements AdminController{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private GradeVO gradeVO;
	
	@Autowired
	private MemberVO memberVO;
	
	//화면 전환
	@Override
	@RequestMapping(value="/admin/adminMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "admin_mode"); //마이페이지 사이드 메뉴로 설정한다.
		
		return mav;
	}
	
	//Grade Registration 페이지 이동,id값 가져오기
	@Override
	@RequestMapping(value="/admin/gradeForm.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView gradeform(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String viewName = (String)request.getAttribute("viewName");
		gradeVO.setId(id);
		
		memberVO = adminService.gradeForm(gradeVO);
		System.out.println("id!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!등록"+id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",memberVO);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//성적 수정 페이지 이동,id값 가져오기
	@Override
	@RequestMapping(value="/admin/modGrade.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView modGrade(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String viewName = (String)request.getAttribute("viewName");
		gradeVO.setId(id);
				
		GradeVO gradeVO=adminService.modGrade(id);

		ModelAndView mav = new ModelAndView();
		mav.addObject("grade",gradeVO);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//Grade Registration
	@Override
	@RequestMapping(value="/admin/addGrade.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity addGrade(@ModelAttribute("grade") GradeVO grade,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int result = adminService.addGrade(grade);
			result = adminService.updateRank(grade);
			
			message = "<script>";
			message += " alert('Added the score.');";
			message += " location.href='"+request.getContextPath()+"/admin/listGrade.do';";
			message += "</script>";
		}catch(Exception e) {
			message = "<script>";
			message += " alert('An error occurred during the operation. Please try again.');";
			message += " location.href='"+request.getContextPath()+"/admin/listGrade.do';";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//전체 Check Grades
	@Override
	@RequestMapping(value="/admin/listGrade.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView listGrade(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		String viewName = (String)request.getAttribute("viewName");
		List gradeList = adminService.listGrade();
		System.out.println(gradeList+"점수목록!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
		
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("gradeList", gradeList);
		
		return mav;
	}
	
	//개인 Check Grades
	@Override
	@RequestMapping(value="/admin/getUserGrade.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView getUserGrade(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		HttpSession session=request.getSession();
		
		String id = (String)session.getAttribute("UserId");
		gradeVO.setId(id);
		System.out.println(id+"개인 성적!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		String viewName = (String)request.getAttribute("viewName");
		List gradeList = adminService.listGrade(gradeVO);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("gradeList", gradeList);
			
		return mav;		
	}
	
	
	//Student List
	@Override
	@RequestMapping(value="/admin/listMembers.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		String viewName = (String)request.getAttribute("viewName");

		List membersList = adminService.listMembers();
		System.out.println(membersList+"학생목록!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList",membersList);
		
		return mav;
	}
	
	//학생 개인 정보 목록
	@RequestMapping(value="/admin/getUserInfo.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getUserInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		HttpSession session=request.getSession();

		String id = (String)session.getAttribute("UserId");
		memberVO.setId(id);
		System.out.println(id+"개인 화면!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		String viewName = (String)request.getAttribute("viewName");
		
		List membersList = adminService.listMembers(memberVO);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList",membersList);
		
		return mav;
	}
	//점수 수정
	@Override
	@RequestMapping(value="/admin/updateGrade.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ResponseEntity updateMember(@ModelAttribute("grade") GradeVO grade, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		int result = 0;
		
		try {
		result = adminService.updateMember(grade);
		result = adminService.updateRank(grade);
		
		message = "<script>";
		message += " alert('Modified the score.');";
		message += " location.href='"+request.getContextPath()+"/admin/listGrade.do';";
		message += "</script>";
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('An error occurred during the operation. Please try again.');";
			message += " location.href='"+request.getContextPath()+"/admin/listGrade.do';";
			message += "</script>";
			e.printStackTrace();
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}

		
		return resEntity;
	}
	
	
	
}
