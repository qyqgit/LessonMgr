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
		<c:forEach var="lessonList" items="${requestScope.lessonList }">
	 		<tr>
	     		<td><c:out value="${lessonList.id}" /></td>
	     		<td>
                    <c:url value="LessonDetail?lessonId=${lessonList.id}" var="url"></c:url>
                    <a href="${url }" style="text-decoration:none;"><c:out value="${lessonList.name} " escapeXml="false"></c:out></a>
                </td>
	 		</tr>
		</c:forEach>
	</table>
	<form method="post" action="AddLesson?subjectId=${param.subjectId}">
		<label >添加一个课程：</label><br>
		<input type="text" name="name">
		<input type="submit">
	</form>
</body>
</html>