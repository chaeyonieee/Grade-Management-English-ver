package com.student.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.student.member.vo.MemberVO;

public interface MemberController {
	//Sign Up
	public ResponseEntity addMember(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	//회원 Login
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원 Log Out
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//Edit Member이동 페이지 이동, memberVO값 가져오기
	public ModelAndView modMember(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	//Edit Member
	public ResponseEntity updateMember(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
}
