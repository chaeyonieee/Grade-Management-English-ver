package com.student.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.student.member.dao.MemberDAO;
import com.student.member.vo.MemberVO;

@Service("memeberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	//Sign Up
	@Override
	public int addMember(Map memberMap) throws DataAccessException {
		int maxArticle = memberDAO.selectNewArticleNO();

		memberMap.put("articleNO", maxArticle);
		
		memberDAO.insertMember(memberMap);
		
		return maxArticle;
	}
	
	//Login
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.loginById(memberVO);
	}
		
	//수정 Page 이동시 id값 가져오기
	@Override
	public MemberVO modMember(MemberVO memberVO) throws DataAccessException {
		memberVO = memberDAO.loginById(memberVO);
	
		return memberVO;
	}
	
	//Edit Member
	@Override
	public MemberVO updateUser(Map memberMap) throws Exception {
		String id = (String)memberMap.get("id");
		memberDAO.updateMember(memberMap);		
		return memberDAO.selectMemberList(id);
	}
	
}