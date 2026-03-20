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
	<form action="write-ok" method = "post">
		<label>
			<span>상품명</span>
			<input name = "productName" placeholder="상품명" />	
		</label>
		<label>
			<span>재고</span>
			<input name = "productPrice" placeholder="상품 가격" />	
		</label>
		<label>
			<span>상품명</span>
			<input name = "productStock" placeholder="상품 재고" />	
		</label>
		<button>상품 등록</button>
	
	</form>
</body>
</html>