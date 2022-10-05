package org.helpme.service;

import org.helpme.domain.NoticeVO;
import org.helpme.domain.SearchCriteria;
import org.helpme.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public void create(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.create(vo);
	}

	@Override
	public NoticeVO read(int noticeId) throws Exception {
		// TODO Auto-generated method stub
		return mapper.read(noticeId);
	}

	@Override
	public void modify(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.modify(vo);
	}

	@Override
	public void remove(Integer noticeId) throws Exception {
		// TODO Auto-generated method stub
		mapper.remove(noticeId);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return mapper.listAll();
	}

	/*
	 * @Override public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
	 * // TODO Auto-generated method stub return mapper.listCriteria(cri); }
	 * 
	 * @Override public int listCountCriteria(Criteria cri) throws Exception { //
	 * TODO Auto-generated method stub return mapper.countPaging(cri); }
	 */

	@Override
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		List<NoticeVO> list = mapper.listSearch(cri);
		System.out.println("/*** list.size()=" + list.size());
		//return mapper.listSearch(cri);
		return list;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listSearchCount(cri);
	}

}
