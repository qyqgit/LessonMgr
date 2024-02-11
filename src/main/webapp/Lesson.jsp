<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${requestScope.student.name }</title>
</head>
<body>
	<table>
 		<tr bgcolor="#EEEEEE">
     		<td>编号</td>
     		<td>名称</td>
               <td style="text-align: center"><span style="float:left">上课日期</span><span>上课时间</span><span style="float:right">添加记录</span></td>
               <td>删除记录</td>
 		</tr>
		<c:forEach var="lessonList" items="${requestScope.lessonList }">
	 		<tr <c:if test="${lessonList.datetime != null}">bgcolor="#CCFF80"</c:if>>
	     		<td><c:out value="${lessonList.id}" /></td>
	     		<td>
                    <c:url value="LessonDetail?lessonId=${lessonList.id}" var="url"></c:url>
                    <a href="${url }" style="text-decoration:none;"><c:out value="${lessonList.name} " escapeXml="false"></c:out></a>
                </td>
                <td>
				    <form method="post" action="AddRecord?lessonId=${lessonList.id}&subjectId=${lessonList.subjectId}&studentId=${requestScope.student.id}">
						<input type="date" name="date_record" value="${fn:split(lessonList.datetime, ' ')[0]}">
						<input type="time" name="time_record" value="${fn:split(lessonList.datetime, ' ')[1]}">
						<input type="submit" value="添加记录" <c:if test="${lessonList.datetime != null}">disabled</c:if>>
					</form>
                </td>
                <td>
                	<a href="DeleteRecord?lessonId=${lessonList.id}&subjectId=${lessonList.subjectId}&studentId=${requestScope.student.id}" style="text-decoration:none;">删除记录</a>
                </td>
	 		</tr>
		</c:forEach>
	</table>
	<form method="post" action="AddLessonList?subjectId=${param.subjectId }&studentId=${requestScope.student.id}">
		<label >添加多节课：</label><br>
		<textarea name="nameList" cols="55" rows="9"></textarea>
		<br>
		<input type="submit" value="添加">
		<a href="GetStudent" style="text-decoration:none;">返回首页</a>
	</form>
</body>
</html>