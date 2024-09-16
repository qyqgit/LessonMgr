<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="currentTime" class="java.util.Date" scope="page"/>
<fmt:formatDate var="ctime" value="${currentTime}" pattern="yyyy-MM-dd" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生</title>
</head>
<body>
	<c:out value="${sessionScope.teacher.name }"></c:out>
	<c:if test="${sessionScope.teacher == null }"><a href="Login.jsp" style="text-decoration:none;">登录</a></c:if>
	<c:if test="${sessionScope.teacher != null }"><a href="Logout" style="text-decoration:none;">注销</a></c:if>
	<table>
		<tr bgcolor="#EEEEEE">
	   		<td>学号</td>
	   		<td>姓名</td>
	   		<td>性别</td>
	   		<td>年龄</td>
	   		<td>科目(上课次数)</td>
	   		<td>已上课次合计</td>
	   		<td>总课次</td>
	   		<td>上课记录</td>
		</tr>
		<c:forEach var="studentList" items="${requestScope.studentList }">
	 		<tr>
	     		<td><c:out value="${studentList.id}" /></td>
	     		<td>
                    <c:url value="GetSubject?studentId=${studentList.id}" var="url"></c:url>
                    <a href="${url }" style="text-decoration:none;"><c:out value="${studentList.name} " escapeXml="false"></c:out></a>
                </td>
                <td>
	     			<c:if test="${studentList.sex == 0 }">男</c:if>
	     			<c:if test="${studentList.sex == 1 }">女</c:if>
	     		</td>
	     		<td>
	     			<c:if test="${studentList.birthday != null }"> 
	     				<c:out value="${fn:split(ctime, '-')[0] - fn:split(studentList.birthday, '-')[0]}"/>
	     			</c:if>
	     		</td>
	     		<td>
	     			<table>
	     				<tr>
							<c:set value="0" var="cooked_sum"/>
 							<c:set value="0" var="amount_sum"/>
	     					<c:forEach var="subject" items="${studentList.subjectList }">
								<c:set value="${cooked_sum+subject.cooked }" var="cooked_sum"/>
								<c:set value="${amount_sum+subject.amount }" var="amount_sum"/>
	     						<td>
	     							<c:url value="GetLesson?subjectId=${subject.id}&studentId=${studentList.id}" var="url"></c:url>
                    				<a href="${url }" style="text-decoration:none;"><c:out value="${subject.name} " escapeXml="false"></c:out></a>
	     						</td>
	     						<td>
	     							(${subject.cooked})
	     						</td>
	     					</c:forEach>
	     				</tr>
	     			</table>
	     		</td>
	     		<td>${cooked_sum }</td>
	     		<td>${amount_sum}</td>
	     		<td>
	     			<a href="GetRecord?studentId=${studentList.id }" style="text-decoration:none;">上课记录</a>
	     		</td>
	     		<!--<td><c:out value="${studentList.date}" /></td>-->
	 		</tr>
		</c:forEach>
	</table>
	<form action="AddStudent">
		<label >添加一名同学：</label><br>
		<input type="text" name="name">
		<input type="date" name="birthday" value="2010-01-01">
		<select name="sex">
			<option value="0">男</option>
			<option value="1">女</option>
		</select>
		<input type="submit" value="添加">
	</form>
</body>
</html>