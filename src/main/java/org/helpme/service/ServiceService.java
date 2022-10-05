package org.helpme.service;

import org.apache.ibatis.annotations.Param;
import org.helpme.domain.SearchCriteria;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.DealDTO;

import java.util.List;

public interface ServiceService {

	public List<ServiceVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void regist(ServiceVO service) throws Exception;

	public ServiceVO read(Integer sNo) throws Exception;

	public void modify(ServiceVO service) throws Exception;

	public void remove(Integer sNo) throws Exception;

	public boolean likeCheck(Integer sNo, String userId);

	public void likeIt(Integer sNo, String userId);

	public boolean purchaseCheck(Integer sNo, String userId);

	public void purchase(DealDTO deal);

	public void detailAttach(@Param("sNo") Integer sNo, @Param("attName") String attName);

	public Integer getLastSNo();

	public String[] getAttach(int sNo);

	public void deleteDetail(Integer sNo);

	public boolean likeServiceCheck(String userId, Integer sNo);

	public void likeService(String userId, Integer sNo);

	public void deleteLikeService(String userId, Integer sNo);


}
