package org.conan.mapper;

import org.conan.domain.MemberVO2;

public interface MemberMapper2 {

	public void register(MemberVO2 vo);
	public MemberVO2 login(MemberVO2 vo);
	public int Idcheck(String id);
	public void update(MemberVO2 vo);
}