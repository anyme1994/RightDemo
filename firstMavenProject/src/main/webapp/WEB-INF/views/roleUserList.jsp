<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/demo/demo.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" type="text/css" src="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="easyui-datagrid" style="width:100%;height:100%"
       url="${pageContext.request.contextPath}/userInfo/queryUser?roleid=${param.roleid}" pagination="true" fitColumns="true">
    <thead>
    <tr>
        <th field="id" width="10">id</th>
        <th field="name" width="10">姓名</th>
        <th field="age" width="10">年龄</th>
        <th field="username" width="10">账号</th>
    </tr>
    </thead>
</table>
</body>
</html>
