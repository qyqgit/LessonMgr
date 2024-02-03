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
	 		<tr>
	     		<td><c:out value="${recordList.id}" /></td>
	     		<td><c:out value="${recordList.idLesson}" /></td>
	     		<td><c:out value="${recordList.date}" /></td>
	     		<td><c:out value="${recordList.idTeacher}" /></td>
	     		<td><c:out value="${recordList.idStudent}" /></td>
	     		<td><c:out value="${recordList.timeStamp}" /></td>
	 		</tr>
		</c:forEach>
	</table>
	<form action="AddRecord">
		<label >添加一个上课记录：</label><br>
		<input type="text" name="id_class">
		<input type="date" name="date_record">
		<input type="time" name="time_record">
		<input type="text" name="id_teacher">
		<input type="text" name="id_student">
		<input type="submit">
	</form>
</body>
</html>