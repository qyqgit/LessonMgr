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
	 		<tr <c:if test="${lessonList.datetime != null}">bgcolor="#CCFF80"</c:if>>
	     		<td><c:out value="${lessonList.id}" /></td>
	     		<td>
                    <c:url value="LessonDetail?lessonId=${lessonList.id}" var="url"></c:url>
                    <a href="${url }" style="text-decoration:none;"><c:out value="${lessonList.name} " escapeXml="false"></c:out></a>
                </td>
                <td>
                </td>
                <td>
				    <form method="post" action="AddRecord?lessonId=${lessonList.id}&subjectId=${lessonList.subjectId}&studentId=${param.studentId}">
						<input type="date" name="date_record" value="${fn:split(lessonList.datetime, ' ')[0]}">
						<input type="time" name="time_record" value="${fn:split(lessonList.datetime, ' ')[1]}">
						<input type="submit" value="添加记录">
					</form>
                </td>
                <td>
                	<a href="DeleteRecord?lessonId=${lessonList.id}&subjectId=${lessonList.subjectId}" style="text-decoration:none;">删除记录</a>
                </td>
	 		</tr>
		</c:forEach>
	</table>
	<form method="post" action="AddLesson?subjectId=${param.subjectId}&studentId=${param.studentId}">
		<label >添加一节课：</label><br>
		<input type="text" name="name">
		<input type="submit" value="添加">
	</form>
</body>
</html>