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
    <title>修改书籍</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <div class="row clear fix">
        <div class="col-md-12 column">
            <div class="page-header">
                <small>修改书籍</small>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">

<%--        出现的问题，我们提交了修改的请求，但是修改失败，是事务的问题，配置事务，依旧失败--%>
<%--        查看sql语句，能否执行成功，sql执行失败，修改未完成--%>
        <input type="hidden" name="bookId" value="${QBook.bookId}">
        <div class="form-group">
            <label for=>书籍名称：</label>
            <input type="text" name="bookName" class="form-control" value="${QBook.bookName}" required>
        </div>
        <div class="form-group">
            <label for=>书籍数量：</label>
            <input type="text" name="bookCounts" class="form-control" value="${QBook.bookCounts}" >
        </div>
        <div class="form-group">
            <label for=>书籍详情：</label>
            <input type="text" name="detail" class="form-control" value="${QBook.detail}" >
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="修改"></input>
        </div>
    </form>
</div>
</body>
</html>
