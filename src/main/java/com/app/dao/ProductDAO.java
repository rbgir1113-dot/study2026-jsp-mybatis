package com.app.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.ProductVO;

public class ProductDAO {

	public SqlSession sqlSession;
	
	public ProductDAO() {
//		openSession(autoCommit)
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	상품 추가
	public void insert(ProductVO productVO) {
		sqlSession.insert("product.insert", productVO);
	}
	
	
//	상품 전체조회
	public List<ProductVO> selectAll() {
		List<ProductVO> products = sqlSession.selectList("product.selectAll");
		return products;
	}
	
//	1. 상품 이름을 누르면 mybatis/read로 이동 
//	- 눌렀을 때 그냥 이동만 하면 안된다 OOO을 같이 보내야한다.
//	2. read.jsp: 누른 상품의 상세정보를 화면에 출력하는 페이지 구현
//
//	mybatis/read 페이지에서는 read.jsp로 확장자가 노출되면 안된다.
	
	public Optional<ProductVO> select(Long id) {
		ProductVO products = sqlSession.selectOne("product.select", id);
		return Optional.ofNullable(products);
	}
	
	
//	상품 수정
	public void update(ProductVO productVO) {
		sqlSession.update("product.update",productVO);
	}
	
	
	
//	상품 삭제
	public void delete(Long id) {
		sqlSession.delete("product.delete", id);
	}
}