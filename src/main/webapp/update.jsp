<%@page import="com.app.dao.ProductDAO"%>
<%@page import="com.app.vo.ProductVO"%>
<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style type="text/css">
	label {
		display : block
	}
</style>
</head>
<body>
	<%
		ProductDAO productDAO = new ProductDAO();
		ProductVO product = new ProductVO();

		Long id = Long.parseLong(request.getParameter("id"));
		Optional<ProductVO> foundProduct = productDAO.select(id);
		if(foundProduct.isPresent()) {
			product = foundProduct.get();
			
	%>
		<form action="/mybatis/update-ok" method = "post">
			<input name ="id" placeholder = "상품명"
				type = "hidden"
				value="<%=product.getId() %>"
			/>
		
			<label>
				<span>상품명</span>
				
				<input 
					name = "productName" 
					placeholder="상품명" 
					value = "<%=product.getProductName() %>" />	
			</label>
			<label>
				<span>상품 가격</span>
				<input name = "productPrice" placeholder="상품 가격" value = "<%=product.getProductPrice()%>"/>	
			</label>
			<label>
				<span>상품 재고</span>
				<input name = "productStock" placeholder="상품 재고" value = "<%=product.getProductStock()%>"/>	
			</label>
			<button>상품 수정</button>
		
		</form>
	<%
		}
	%>
</body>
</html>