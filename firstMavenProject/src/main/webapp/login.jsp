<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/bootstrap/easyui.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/demo/demo.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js">
        <style type="text/css">
            *{
                padding: 0;
                margin: 0;
            }
            .panel{
                overflow: hidden;
                text-align: left;
                margin: auto;
                margin-top: 15%;
                border: 0;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" title="Login to system" style="width:400px;padding:30px 70px 20px 70px">
        <form id="fm" method="post" onkeydown="login()">
            <div style="margin-bottom:10px">
                <input class="easyui-textbox" name="username" style="width:100%;height:40px;padding:12px" data-options="prompt:'Username',iconCls:'icon-man',iconWidth:38" autofocus="autofocus">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="password" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38">
            </div>

            <div>
                <a  class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;" onclick="login()">
                    <span style="font-size:14px;">Login</span>
                </a>
            </div>
        </form>
    </div>
    <script type="text/javascript">
        function login() {
            $('#fm').form(
                'submit',
                {
                    url : "${pageContext.request.contextPath}/doLogin",
                    cache:false,
                    success : function(data) {
                        data = eval("(" + data + ")");
                        if (data.code=="errMSG"){
                            $.messager.show({
                                title: 'Error',
                                msg: data.message
                            });
                        }else {
                            window.location.href = "${pageContext.request.contextPath}/toIndex";
                        }
                    }
                });
        }
    </script>
    </body>
    </html>