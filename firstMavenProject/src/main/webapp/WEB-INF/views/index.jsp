<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }
        #head {
            position: relative;
            height: 80px;
            background: #DEDEDE;
            height: 80px;
            border: 0;
        }

        #head a {
            line-height: 75px;
            float: right;
            margin-right: 20px;
            font-size: 18px;
            bold: bold;
            text-decoration:blink;
        }

        #head div {
            position: absolute;
            width: 542px;
            height: 68px;
            top: 10px;
            margin: auto 10px;
        }

        #head div img {
            float: left;
            height: 60px;
            z-index: 10;
            padding-left: 10px;
        }

        #left {
            width: 300px;
        }

        #left div {
            padding: 5px;
            border: 0;
        }

        #foot {
            background: #DEDEDE;
            height: 40px;
            overflow: hidden;
            line-height: 40px;
            border: 0;
        }
    </style>
</head>
<body class="easyui-layout">
<!-- 头部 -->
<div data-options="region:'north'" id="head">
    <a  href="${pageContext.request.contextPath}/logout">&nbsp;注销</a>
    <a  href="javascript:void(0)" >&nbsp;${sessionScope.user.name}</a>
</div>
<!-- 左侧导航 -->
<div data-options="region:'west',title:'&nbsp;导航菜单',split:true,collapsible:false" id="left">
    <div class="easyui-panel">
        <ul class="easyui-tree" id='menuTree' data-options="lines:true"></ul>
    </div>
</div>
<div data-options="region:'center'"
     style="overflow: hidden; width: 100%;">
    <div id='mainTab' class="easyui-tabs"
         style="width: 100%; height: 100%;">
        <div title="欢迎光临" style="padding: 10px;">
            <h3>欢迎</h3>
        </div>
    </div>
</div>
<!-- 底部 -->
<div data-options="region:'south',border:false" id="foot">
    <p align="center">Copyright 2017 All Rights Reserved</p>
</div>
<script type="text/javascript">
    $(function () {
        var index = 0;
        function addPanel(url, title) {
            if (null == url || "" == url) {
                return false;
            }
            if (!$('#mainTab').tabs('exists', title)) {
                $('#mainTab')
                    .tabs(
                        'add',
                        {
                            title: title,
                            content: '<iframe src="'
                            + url
                            + '" frameBorder="0" border="0"  style="width: 100%; height: 100%;"/>',
                            closable: true
                        });
            } else {
                $('#mainTab').tabs('select', title);
            }
        }

        function removePanel() {
            var tab = $('#mainTab').tabs('getSelected');
            if (tab) {
                var index = $('#mainTab').tabs('getTabIndex', tab);
                $('#mainTab').tabs('close', index);
            }
        }
        $('#menuTree').tree({
            url: "${pageContext.request.contextPath}/menu/getMenus",
            method: "post",
            animate: true,
            onClick: function (node) {
                addPanel(node.url, node.text); // 在用户点击的时候提示
                //alert(node.url);
            },
            onBeforeLoad: function (node, param) {
                $.messager.progress({
                    title: '提示', //显示在头部面板上的标题文字，默认值是 ''
                    msg: '正在加载菜单...', //消息框的文本，默认值是 ''
                    text: '加载中', //显示在进度条里的文字，默认值是 undefined
                    interval: 500 //每次进度更新之间以毫秒为单位的时间长度。默认值是 300
                });
                setTimeout(function () {
                    $.messager.progress('close');
                }, 5000);
            },
            onLoadSuccess: function (node, param) {
                $.messager.progress("close");
            },
            onLoadError: function (node, param) {
                $.messager.progress("close");
                $.messager.alert("提示", "菜单加载出错，请联系管理员", "info");
            }
        });
    });

    function infoEdit() {
        var url,
            title;
        url = '${pageContext.request.contextPath}/view/systemUserInfoEdit.jsp';
        title = '${sessionScope.SessionUser.name}用户信息';
        $('#mainTab')
        if (!$('#mainTab').tabs('exists', title)) {
            $('#mainTab')
                .tabs(
                    'add',
                    {
                        title: title,
                        content: '<iframe src="'
                        + url
                        + '" frameBorder="0" border="0"  style="width: 100%; height: 100%;"/>',
                        closable: true
                    });
        } else {
            $('#mainTab').tabs('select', title);
        }
    }
</script>
</body>
</html>
