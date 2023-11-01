package com.student.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.student.admin.vo.GradeVO;
import com.student.member.vo.MemberVO;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {
	//학생 전체 목록
	public List selectAllMemberList() throws DataAccessException;
	
	//학생 개인 목록
	public List selectAllMemberList(MemberVO memberVO) throws DataAccessException;
	
	//개인 Check Grades
	public List selectAllgradeList() throws DataAccessException;
	
	//Check Grades
	public List selectAllgradeList(GradeVO gradeVO) throws DataAccessException;
		
	//Grade Registration
	public int insertGrade(GradeVO gradeVO) throws DataAccessException;
	
	//랭킹 업데이트
	public int updateRank(GradeVO gradeVO) throws DataAccessException;
	
	//등록 Page 이동시 id값 가져오기
	public MemberVO selectMemberById(GradeVO gradeVO) throws DataAccessException;
	
	//수정 Page 이동시 id값 가져오기
	public GradeVO selectMemberId(String id) throws DataAccessException;
	
	//점수 수정
	public int updateGrade(GradeVO gradeVO) throws DataAccessException;
}
