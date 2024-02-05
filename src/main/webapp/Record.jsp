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
		<tr bgcolor="#EEEEEE"><td>上课时间</td><td>科目</td><td>课程名称</td><td>老师</td><td>学生</td><td>课次</td></tr>
		<c:forEach var="recordList" items="${requestScope.recordList }">
	 		<tr>
	     		<!--<td><c:out value="${recordList.id}" /></td>-->
	     		<td><c:out value="${recordList.date}" /></td>
	     		<td><c:out value="${recordList.idSubject}" /></td>
	     		<td><c:out value="${recordList.idLesson}" /></td>
	     		<td><c:out value="${recordList.idTeacher}" /></td>
	     		<td><c:out value="${recordList.idStudent}" /></td>
	     		<!--<td><c:out value="${recordList.timeStamp}" /></td>-->
	     		<td><c:out value="${recordList.times}" /></td>
	 		</tr>
	 		<tr><td><hr></td><td><hr></td><td><hr></td><td><hr></td><td><hr></td><td><hr></td></tr>
		</c:forEach>
	</table>
</body>
</html>