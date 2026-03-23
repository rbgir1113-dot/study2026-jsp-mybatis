<%@page import="com.app.vo.ProductVO"%>
<%@page import="java.util.Optional"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 조회</title>
</head>
<body></body>

   <% 
      Long id = Long.parseLong(request.getParameter("id"));
      ProductDAO productDAO = new ProductDAO(); 
      Optional<ProductVO> foundProduct = productDAO.select(id);
      
   %>
   <table border="1">
      <tr>
         <th>상품번호</th>
         <th>상품명</th>
         <th>상품가격</th>
         <th>상품재고</th>
      </tr>
   <%   
      if(foundProduct.isPresent()){
         ProductVO product = foundProduct.get();
   %>
      <tr>
         <td><%=product.getId() %></td>
         <td><%=product.getProductName() %></td>
         <td><%=product.getProductPrice() %></td>
         <td><%=product.getProductStock() %></td>
      </tr>
   <tr>
   	<td>
 		<a href="/mybatis/update?id=<%=product.getId() %>">수정하기</a>
   	</td>
   	<td>
   		<a href="/mybatis/delete?id=<%=product.getId() %>">삭제하기</a>
   	</td>
   </tr>
   <%   
      }
   %>
</html>









