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
		<tr bgcolor="#EEEEEE">
			<td>序号</td>
     		<td>科目</td>
            <td>上课次数</td>
            <td>总课数</td>
 		</tr>
		<c:forEach var="subjectList" items="${requestScope.subjectList }">
	 		<tr>
	 			<td>${subjectList.id}</td>
	     		<td>
                    <c:url value="GetLesson?subjectId=${subjectList.id}&studentId=${param.studentId}" var="url"></c:url>
                    <a href="${url }" style="text-decoration:none;"><c:out value="${subjectList.name} " escapeXml="false"></c:out></a>
                </td>
                <td>
                	${subjectList.cooked}
                </td>
                <td>
                	${subjectList.amount}
                </td>
	 		</tr>
		</c:forEach>
	</table>
	<form method="post" action="AddSubject?studentId=${param.studentId}">
		<label >添加一个科目：</label><br>
		<input type="text" name="subject_name">
		<input type="submit" value="添加">
	</form>
</body>
</html>