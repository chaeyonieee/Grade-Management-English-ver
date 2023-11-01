package com.student.member.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.student.admin.vo.GradeVO;
import com.student.member.service.MemberService;
import com.student.member.vo.MemberVO;

@Controller("MemberController")
public class MemberControllerImpl implements MemberController{
	private static final String ARTICLE_IMAGE_REPO = "C:\\mystudent\\article_image";
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private GradeVO gradeVO;
	
	//메인 페이지 이동
	@RequestMapping(value= "/member/main.do", method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//Sign Up
	@Override
	@RequestMapping(value="/member/addMember.do", method=RequestMethod.POST)
	public ResponseEntity addMember(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> memberMap = new HashMap<String, Object>();
		
		Enumeration enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);

			System.out.println("name: " + name + "	" + "value: " + value);

			memberMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);
	
		memberMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int articleNO = memberService.addMember(memberMap);

			System.out.println("articleNO:" + articleNO);

			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += " alert('The registration has been completed.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/member/loginForm.do';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			message = "<script>";
			message += " alert('An error occurred while adding.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/member/memberForm.do';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}
		return resEnt;
		
	}
	
	//Login
	@Override
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		memberVO = memberService.login(member);
		
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			session.setAttribute("UserId", member.getId());
			
			
			String action = (String)session.getAttribute("action");
			
			session.removeAttribute("action");
			
			if(action !=null) {
				mav.setViewName("redirect:"+action);
			}else {
				mav.setViewName("redirect:/member/main.do");
			}
		}else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}return mav;
	}
	
	//Log Out	
	@Override
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.removeAttribute("UserId");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/main.do");
		
		return mav;
	}
	
	//Edit Member Page 이동, memberVO값 가져오기
	@Override
	@RequestMapping(value="/member/modMember.do",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String viewName = (String)request.getAttribute("viewName");
		
		memberVO.setId(id);
		
		System.out.println(id);
		
		memberVO = memberService.modMember(memberVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", memberVO);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//Edit Member
	@Override
	@RequestMapping(value = "/member/updateMember.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity updateMember(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		Map<String, Object> updateMap = new HashMap<String, Object>();
		
		HttpSession session=multipartRequest.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		Enumeration enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			updateMap.put(name, value);
			System.out.println("수정 name : "+name+", 수정 값: "+value);
		}
		
		String imageFileName = upload(multipartRequest);
		updateMap.put("imageFileName", imageFileName);
		
		System.out.println("imageFileName : "+imageFileName);
		
		String articleNO = (String)updateMap.get("articleNO");
		
		System.out.println("articleNO : "+articleNO);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			System.out.println("updateMap : "+updateMap);
			memberVO = (MemberVO) memberService.updateUser(updateMap);
			session.removeAttribute("member");
			session.setAttribute("member",memberVO);
			System.out.println(memberVO);
			
			System.out.println(session.getAttribute("member"));
			
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

				String originalFileName = (String) updateMap.get("originalFileName");
				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message += " alert('Edited the post.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/member/main.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = "<script>";
			message += " alert('An error occurred while editing.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/member/main.do';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value="/member/*Form.do", method=RequestMethod.GET)
	private ModelAndView form(@RequestParam(value="result", required=false) String result,@RequestParam(value="action",required=false) String action,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}
	

	//사진 업로드 메서드
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);

			imageFileName = mFile.getOriginalFilename();

			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);

			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
				}
			}
		} // while
		return imageFileName;
	}// upload
	
}
