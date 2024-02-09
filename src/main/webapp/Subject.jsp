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
     		<td>科目</td>
            <td>已上课次</td>
            <td>总课次</td>
 		</tr>
 		<c:set value="0" var="cooked_sum"/>
 		<c:set value="0" var="amount_sum"/>
		<c:forEach var="subjectList" items="${requestScope.subjectList }">
			<c:set value="${cooked_sum+subjectList.cooked }" var="cooked_sum"/>
			<c:set value="${amount_sum+subjectList.amount }" var="amount_sum"/>
	 		<tr>
	 			<td>${subjectList.id}</td>
	     		<td>
                    <c:url value="GetLesson?subjectId=${subjectList.id}&studentId=${requestScope.student.id}" var="url"></c:url>
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
		<tr>
			<td><hr></td>
			<td><hr></td>
			<td><hr></td>
			<td><hr></td>
		</tr>
		<tr>
			<td></td>
			<td>合计</td>
			<td>${cooked_sum }</td>
			<td>${amount_sum}</td>
		</tr>
	</table>
	<br>
	<form method="post" action="AddSubject?studentId=${requestScope.student.id}">
		<label >添加一个科目：</label><br>
		<input type="text" name="subject_name">
		<input type="submit" value="添加">
		<a href="GetStudent" style="text-decoration:none;">返回</a>
	</form>
</body>
</html>