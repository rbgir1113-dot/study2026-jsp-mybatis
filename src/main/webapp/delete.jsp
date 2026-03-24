<%@page import="java.util.Optional"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@page import="com.app.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
</head>
<body>
	<%
		ProductDAO productDAO = new ProductDAO();
		ProductVO productVO = new ProductVO();
		
		Long id = Long.parseLong(request.getParameter("id"));
		Optional<ProductVO> foundProduct = productDAO.select(id);
		if(foundProduct.isPresent()) {
			productVO = foundProduct.get();
	%>
		<form action="/mybatis/delete-ok" method = "post">
			<input name = "id" placeholder = "상품명"
				type = "hidden"
				value = "<%=productVO.getId() %>"
			/>
			
			<label>
				<span>상품명</span>
				<input
					name = "productName"
					placeholder= "상품명"
					value = "<%=productVO.getProductName() %>"/>
			
			</label>
			
			<label>
				<span>상품 가격</span>
				<input
					name = "productName"
					placeholder= "상품명"
					value = "<%=productVO.getProductPrice() %>"/>
			
			</label>
			
			<label>
				<span>상품 재고</span>
				<input name = "productStock" placeholder= "상품 재고" value = "<%=productVO.getProductStock() %>"/>
			</label>
			<button>상품 삭제</button>
		
		</form>		
			
			
		<%
		}
		%>	
</body>
</html>