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
                <td>
                </td>
                <td>
				    <form method="post" action="AddRecord?lessonId=${lessonList.id}&subjectId=${lessonList.subjectId}">
						<input type="date" name="date_record">
						<input type="time" name="time_record">
						<input type="submit" value="添加记录">
					</form>
                </td>
                <td>
                	<a href="DeleteRecord?lessonId=${lessonList.id}" style="text-decoration:none;">删除记录</a>
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