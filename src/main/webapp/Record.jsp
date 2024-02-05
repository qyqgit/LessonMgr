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
		<c:forEach var="recordList" items="${requestScope.recordList }">
	 		<tr bgcolor="#CCFF80">
	     		<!--<td><c:out value="${recordList.id}" /></td>-->
	     		<td><c:out value="${recordList.date}" /></td>
	     		<td><c:out value="${recordList.idSubject}" /></td>
	     		<td><c:out value="${recordList.idLesson}" /></td>
	     		<td><c:out value="${recordList.idTeacher}" /></td>
	     		<td><c:out value="${recordList.idStudent}" /></td>
	     		<!--<td><c:out value="${recordList.timeStamp}" /></td>-->
	     		<td><c:out value="${recordList.times}" /></td>
	 		</tr>
		</c:forEach>
	</table>
</body>
</html>