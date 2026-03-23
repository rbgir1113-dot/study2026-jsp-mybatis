<%@page import="com.app.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 전체 목록 조회</title>
</head>
<body>
	<%
		ProductDAO productDAO = new ProductDAO();
		List<ProductVO> products = productDAO.selectAll();
	%>
		<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>상품재고</th>
		</tr>
	<%
		for(ProductVO product : products) {
	%>
		<tr>
			<td><%= product.getId() %></td>
			<td>
				<a href="/mybatis/read?id=<%= product.getId() %>">
				<%= product.getProductName() %>
				</a>
				</td>
			<td><%= product.getProductPrice() %></td>
			<td><%= product.getProductStock() %></td>
		</tr>	
	<%
		}
	%>
		</table>
	


</body>
</html>