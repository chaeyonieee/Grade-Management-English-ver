package com.student.admin.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.student.admin.vo.GradeVO;
import com.student.member.vo.MemberVO;

public interface AdminService {
	//전체 Student List
	public List listMembers() throws DataAccessException;
	
	//학생 개인 목록
	public List listMembers(MemberVO memberVO) throws DataAccessException;
	
	//전체 Check Grades
	public List listGrade(GradeVO gradeVO) throws DataAccessException;
	
	//개인 Check Grades
	public List listGrade() throws DataAccessException;
	
	//Grade Registration
	public int addGrade(GradeVO gradeVO) throws DataAccessException;
	
	//랭킹 업데이트
	public int updateRank(GradeVO gradeVO) throws DataAccessException;
	
	//Grade Registration Page으로 이동
	public MemberVO gradeForm(GradeVO gradeVO) throws DataAccessException;
	
	//성적 수정 Page으로 이동
	public GradeVO modGrade(String id) throws DataAccessException;
	
	//성적 수정
	public int updateMember(GradeVO gradeVO) throws DataAccessException;
}
