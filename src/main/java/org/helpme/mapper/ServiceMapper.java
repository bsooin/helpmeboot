package org.helpme.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.helpme.domain.SearchCriteria;
import org.helpme.domain.ServiceVO;
import org.helpme.dto.DealDTO;

import java.util.List;

@Mapper
public interface ServiceMapper {
	
	int listSearchCount(SearchCriteria cri) throws Exception;
	
	void regist(ServiceVO serviceVO) throws Exception;

	List<ServiceVO> listSearch(SearchCriteria cri) throws Exception;
	
	ServiceVO read(int sNo) throws Exception;
	
	void remove(int sNo) throws Exception;
	
	void modify(ServiceVO serviceVO) throws Exception;
	
	void updateViewCount(int sNo) throws Exception;

	String likeCheck(@Param("sNo")Integer sNo,@Param("userId") String userId);

	void likeIt(@Param("sNo") Integer sNo,@Param("userId") String userId);

	String[] purchaseCheck(@Param("sNo")Integer sNo,@Param("userId") String userId);
	
	void purchase(DealDTO deal);

	void detailAttach(@Param("sNo") Integer sNo,@Param("attName") String attName);

	ServiceVO getLastSNo();

	String[] getAttach(int sNo);

	void updateLikeIt(Integer sNo);

	void updatePurchase(Integer sNo);

	void deleteDetail(Integer sNo);

	Integer likeServiceCheck(@Param("userId") String userId,@Param("sNo")Integer sNo);

	void likeService(@Param("userId") String userId,@Param("sNo")Integer sNo);

	void deleteLikeService(@Param("userId") String userId,@Param("sNo")Integer sNo);
	
}
