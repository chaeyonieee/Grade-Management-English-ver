package com.student.member.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.student.member.vo.MemberVO;

public interface MemberService {
	//Sign Up	 
	public int addMember(Map memberMap) throws DataAccessException;
	//Login
	public MemberVO login(MemberVO memberVO) throws Exception;
	//Edit Member Page으로 이동 id값 가져오기
	public MemberVO modMember(MemberVO memberVO) throws DataAccessException;
	//Edit Member
	public MemberVO updateUser(Map memberMap) throws Exception;
}
