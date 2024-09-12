package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ZzimDTO;

@Repository
public class MyPageDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mapper.MyPageMapper";
	
	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		System.out.println("MyPageDAO getProductList()");
		return sqlSession.selectList(namespace + ".getProductList", pageDTO);
	}
	
	public int getProductCount(PageDTO pageDTO) {
		System.out.println("MyPageDAO getProductCount()");
		return sqlSession.selectOne(namespace + ".getProductCount", pageDTO);
	}
	
	public List<ProductDTO> getZzimList(PageDTO pageDTO) {
		System.out.println("MyPageDAO getZzimList()");
		return sqlSession.selectList(namespace + ".getZzimList", pageDTO);
	}
	
	public int getZzimCount(PageDTO pageDTO) {
		System.out.println("MyPageDAO getZzimCount()");
		return sqlSession.selectOne(namespace + ".getZzimCount", pageDTO);
	}

	public void deleteZzim(ZzimDTO zzimDTO) {
		System.out.println("MyPageDAO deleteZzim()");
		sqlSession.delete(namespace + ".deleteZzim", zzimDTO);
	}

	public List<ProductDTO> getBuyList(PageDTO pageDTO) {
		System.out.println("MyPageDAO getBuyList()");
		return sqlSession.selectList(namespace + ".getBuyList", pageDTO);
	}

	public int getBuyCount(PageDTO pageDTO) {
		System.out.println("MyPageDAO getBuyCount()");
		return sqlSession.selectOne(namespace + ".getBuyCount", pageDTO);
	}

	public void deleteMem(String member_id) {
		System.out.println("MyPageDAO deleteMem()");
		sqlSession.update(namespace + ".deleteMem", member_id);
	}

	public int allTX(String id) {
		System.out.println("MyPageDAO allTX()");
		return sqlSession.selectOne(namespace + ".allTX", id);
	}
	
		
	
	
	
}
