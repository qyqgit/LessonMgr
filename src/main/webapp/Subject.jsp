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
		<c:forEach var="subjectList" items="${requestScope.subjectList }">
	 		<tr>
	     		<td><c:out value="${subjectList.id}" /></td>
	     		<td>
                    <c:url value="GetLesson?subjectId=${subjectList.id}" var="url"></c:url>
                    <a href="${url }" style="text-decoration:none;"><c:out value="${subjectList.name} " escapeXml="false"></c:out></a>
                </td>
	 		</tr>
		</c:forEach>
	</table>
	<form method="post" action="AddSubject?studentId=${param.studentId}">
		<label >添加一个科目：</label><br>
		<input type="text" name="subject_name">
		<input type="submit">
	</form>
</body>
</html>