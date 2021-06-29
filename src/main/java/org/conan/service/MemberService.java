package org.conan.service;

import org.conan.domain.MemberVO2;
import org.springframework.beans.factory.annotation.Autowired;
public interface MemberService {

@Autowired
public void  register(MemberVO2 vo) throws Exception;
public MemberVO2 login(MemberVO2 vo) ;
public int Idcheck(String id);
public void Update(MemberVO2 vo);
}
