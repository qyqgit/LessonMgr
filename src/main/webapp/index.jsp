<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach var="studentList" items="${requestScope.studentList }">
	 		<tr>
	     		<td><c:out value="${studentList.id}" /></td>
	     		<td><c:out value="${studentList.name}" /></td>
	     		<td><c:out value="${studentList.birthday}" /></td>
	     		<td><c:out value="${studentList.sex}" /></td>
	     		<td><c:out value="${studentList.date}" /></td>
	 		</tr>
		</c:forEach>
	</table>
	<form action="AddStudent">
		<label >添加一名同学：</label><br>
		<input type="text" name="name">
		<input type="date" name="birthday">
		<input type="text" name="sex">
		<input type="submit">
	</form>
</body>
</html>