package com.student.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.student.admin.vo.GradeVO;

public interface AdminController {
	//Administrator Mode 클릭시 화면 변환
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	//Grade Registration
	public ResponseEntity addGrade(@ModelAttribute("grade") GradeVO grade,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	//Check Grades
	public ModelAndView listGrade(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	//성적 개인 확인
	public ModelAndView getUserGrade(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	//Student List
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//학생 개인 정보 목록
	public ModelAndView getUserInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//Grade Registration 페이지 이동,id값 가져오기
	public ModelAndView gradeform(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//성적 수정 페이지 이동,id값 가져오기
	public ModelAndView modGrade(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//성적 수정
	public ResponseEntity updateMember(@ModelAttribute("grade") GradeVO grade, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
