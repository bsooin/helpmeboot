package org.helpme.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.helpme.domain.MemberVO;
import org.helpme.mapper.AdminMemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class AdminMemberServiceImpl implements AdminMemberService {

    @Autowired
    AdminMemberMapper adminMemberMapper;


    @Override
    public List<MemberVO> memberList() {
        // TODO Auto-generated method stub
        return adminMemberMapper.memberList();
    }

    @Override
    public void insertMember(MemberVO vo) {
        // TODO Auto-generated method stub
        adminMemberMapper.insertMember(vo);
    }

    @Override
    public MemberVO viewMember(String userId) {
        return adminMemberMapper.viewMember(userId);
    }

    @Override
    public void deleteMember(String userId) {
        // TODO Auto-generated method stub
        adminMemberMapper.deleteMember(userId);
    }

    @Override
    public void updateMember(MemberVO vo) {
        // TODO Auto-generated method stub
        adminMemberMapper.updateMember(vo);
    }

	/*
	@Override
	public List<MemberVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		List<MemberVO> list = adminMemberMapper.listSearch(cri);
		System.out.println("/*** list.size()=" + list.size());
		//return mapper.listSearch(cri);
		
		return list;

	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return  adminMemberMapper.listSearchCount(cri);
	} */
}








