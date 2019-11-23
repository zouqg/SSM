<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zouqianggui
  Date: 2019/11/22
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示页面</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <div class="row clear fix">
        <div class="col-md-12 column">
            <div class="page-header">
                <small>书籍列表-显示所有书籍</small>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
<%--            add book--%>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/AddPaper">添加书籍</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column" style="float: right">
            <form class="form-line" action="${pageContext.request.contextPath}/book/queryBook" method="">
                <input type="text" name="queryBookName" class="form-control" placeholder="请输入书籍名称">
                <input type="submit" class="btn btn-primary" value="查询">
                <span style="color: red">${error}</span>
            </form>
        </div>
    </div>

    <div class="row clear fix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>书籍名称</th>
                        <th>书籍数量</th>
                        <th>书籍编号</th>
                        <th>书籍详情</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${list}">
                    <tr>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.bookId}</td>
                        <td>${book.detail}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/update?id=${book.bookId}" >修改</a>
                            &nbsp;|&nbsp;
                            <a href="${pageContext.request.contextPath}/book/deleteBook/${book.bookId}" >删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
