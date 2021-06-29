package org.conan.service;


import org.conan.domain.MemberVO2;
import org.conan.mapper.MemberMapper2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MemberServiceImpl implements MemberService {
@Autowired
private MemberMapper2 mapper;
	@Override
	public void register(MemberVO2 vo) {
		// TODO Auto-generated method stub
		
		mapper.register(vo);
	}
	@Override
	public MemberVO2 login(MemberVO2 vo) {
		// TODO Auto-generated method stub
		 return mapper.login(vo);
	}
	@Override
	public int Idcheck(String id) {
		// TODO Auto-generated method stub
		return mapper.Idcheck(id);
	}
	@Override
	public void Update(MemberVO2 vo) {
		// TODO Auto-generated method stub
	 	mapper.update(vo);
	}
	
	



}
