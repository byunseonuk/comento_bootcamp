<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
	<%@include file="./common_resource.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/home.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" />
</head>
<body>
	<button id="load_movieList" type="button">영화 목록 가져오기</button>
	<table>
		<thead>
			<tr>
				<th>영화이름</th>
				<th>감독</th>
				<th>장르</th>
			</tr>
		</thead>
		<tbody id="movieList">
			
		</tbody>
	</table>
</body>
</html>
