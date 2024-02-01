<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach var="classLevelList" items="${requestScope.classLevelList }">
	 		<tr>
	     		<td><c:out value="${classLevelList.id}" /></td>
	     		<td><c:out value="${classLevelList.name}" /></td>
	 		</tr>
		</c:forEach>
	</table>
	<form action="AddClassLevel?studentId=${param.studentId}">
		<label >添加一个课程级别：</label><br>
		<input type="text" name="class_level_name">
		<input type="submit">
	</form>
</body>
</html>