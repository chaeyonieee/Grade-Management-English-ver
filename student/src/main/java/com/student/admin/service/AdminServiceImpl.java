package com.student.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.student.admin.dao.AdminDAO;
import com.student.admin.vo.GradeVO;
import com.student.member.vo.MemberVO;

@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private GradeVO gradeVO;
	
	//전체 Student List
	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = adminDAO.selectAllMemberList();
		return membersList;
	}
	
	
	//개인 Student List
	@Override
	public List listMembers(MemberVO memberVO) throws DataAccessException {
		List membersList = null;
		membersList = adminDAO.selectAllMemberList(memberVO);
		return membersList;
	}
	
	//전체 Check Grades
	@Override
	public List listGrade() throws DataAccessException {
		List listGrade = null;
		listGrade = adminDAO.selectAllgradeList();
		return listGrade;
	}
	
	//개인 Check Grades	
	@Override
	public List listGrade(GradeVO gradeVO) throws DataAccessException {
		List listGrade = null;
		listGrade = adminDAO.selectAllgradeList(gradeVO);
		return listGrade;
	}
	
	//Register Grades
	@Override
	public int addGrade(GradeVO grade) throws DataAccessException {
		return adminDAO.insertGrade(grade);
	}
	
	//랭킹 업데이트
	@Override
	public int updateRank(GradeVO gradeVO) throws DataAccessException {
		return adminDAO.updateRank(gradeVO);
	}


	//Grade Registration Page 가져오기 id값 가져오기
	public MemberVO gradeForm(GradeVO gradeVO) throws DataAccessException {
		memberVO = adminDAO.selectMemberById(gradeVO);
		
		return memberVO;
	}

	//성적 수정 Page으로 이동
	@Override
	public GradeVO modGrade(String id) throws DataAccessException {
		GradeVO gradeVO = new GradeVO();
		gradeVO = adminDAO.selectMemberId(id);
		return gradeVO;
	}

	//Grade Registration
	@Override
	public int updateMember(GradeVO gradeVO) throws DataAccessException {
		return adminDAO.updateGrade(gradeVO);
	}
	
	
}
