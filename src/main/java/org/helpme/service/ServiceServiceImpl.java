package org.helpme.service;

import org.helpme.domain.SearchCriteria;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.DealDTO;
import org.helpme.mapper.ServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private ServiceMapper serviceMapper;

	@Override
	public List<ServiceVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		if (cri.getKeyword() != null) {
			if (cri.getKeyword().trim() == "") {
				cri.setKeyword(null);
			}
		}
		if (cri.getOrderType() != null) {
			if (cri.getOrderType().trim() == "") {
				cri.setOrderType(null);
			}
		}

		return serviceMapper.listSearch(cri);

	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return serviceMapper.listSearchCount(cri);
	}

	@Override
	public void regist(ServiceVO service) throws Exception {

		serviceMapper.regist(service);

	}

	@Override
	public ServiceVO read(Integer sNo) throws Exception {
		serviceMapper.updateViewCount(sNo);
		return serviceMapper.read(sNo);
	}

	@Override
	public void modify(ServiceVO service) throws Exception {
		serviceMapper.modify(service);

	}

	@Override
	public void remove(Integer sNo) throws Exception {
		serviceMapper.remove(sNo);

	}

	@Override
	public boolean likeCheck(Integer sNo, String userId) {
		if (serviceMapper.likeCheck(sNo, userId) != null)
			return true;
		return false;
	}

	@Override
	public void likeIt(Integer sNo, String userId) {
		serviceMapper.likeIt(sNo, userId);
		serviceMapper.updateLikeIt(sNo);

	}

	@Override
	public boolean purchaseCheck(Integer sNo, String userId) {
		if (serviceMapper.purchaseCheck(sNo, userId).length!=0)
			return true;
		return false;
	}

	@Override
	public void purchase(DealDTO deal) {
		serviceMapper.purchase(deal);
		serviceMapper.updatePurchase(deal.getsNo());

	}

	@Override
	public void detailAttach(Integer sNo, String attName) {
		serviceMapper.detailAttach(sNo, attName);
		
	}

	@Override
	public Integer getLastSNo() {
		return serviceMapper.getLastSNo().getSNo();
	}

	@Override
	public String[] getAttach(int sNo) {
		return serviceMapper.getAttach(sNo);
	}

	@Override
	public void deleteDetail(Integer sNo) {
		serviceMapper.deleteDetail(sNo);
		
	}

	@Override
	public boolean likeServiceCheck(String userId, Integer sNo) {
		if(serviceMapper.likeServiceCheck(userId,sNo)==null)
			return false;
		return true;
	}

	@Override
	public void likeService(String userId, Integer sNo) {
		serviceMapper.likeService(userId,sNo);
	}


	@Override
	public void deleteLikeService(String userId, Integer sNo) {
		serviceMapper.deleteLikeService(userId,sNo);
		
	}

}
