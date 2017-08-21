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
<table id="dg" title="用户操作" class="easyui-datagrid" style="width:100%;height:100%"
            url="${pageContext.request.contextPath}/userInfo/queryUser?roleid=${param.roleid}"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true">
        <thead>
            <tr>
                <th field="cb" checkbox="true" align="center"></th>
                <th field="id" width="10">id</th>
                <th field="name" width="10">姓名</th>
                <th field="age" width="10">年龄</th>
                <th field="username" width="10">账号</th>
                <th field="password" width="10">密码</th>
                <th field="rolename" width="10">角色</th>
                <%--<th field="roleid" width="10">角色</th>--%>
            </tr>
        </thead>
    </table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
    <div style="float: right;">
        <input class="easyui-searchbox" data-options="prompt:'请输入姓名查询...',searcher:doSearch" style="width:300px"></input>
    </div>
</div>
<div id="dlg" class="easyui-dialog" style="width:400px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
        <div style="margin-bottom:10px;display: none">
            <input name="id" class="easyui-textbox" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="name" class="easyui-textbox" required="true" missingMessage="必须填写姓名" label="姓名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="age" class="easyui-textbox"  label="年龄:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="username" class="easyui-textbox" required="true" missingMessage="必须填写账号" label="账号:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="password" class="easyui-textbox" required="true" missingMessage="必须填写密码" label="密码:" style="width:100%">
        </div>
        <div style="margin-bottom: 10px">
            <input id="cc" name="roleid" label="角色分配："
                   class="easyui-combobox" style="width: 100%" editable="false"/>
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>
<script type="text/javascript">
        var url;
        
         function doSearch(value){
			var name = value;
			$('#dg').datagrid('load', {
			"name" : name,
		});
		}
        function newUser(){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加用户');
            $('#fm').form('clear');
            $('#cc').combobox("enable");
            url = '${pageContext.request.contextPath}/userInfo/addUser';
        }
       
        function editUser(){
            var row = $('#dg').datagrid('getSelections');
            if (row.length == 1){
                $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改用户信息');
                $('#fm').form('load',row[0]);
                url = '${pageContext.request.contextPath}/userInfo/updateUser';
            }else{
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
			    return;
            }
        }
        function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.code=="errMSG"){
                        $.messager.show({
                            title: 'Error',
                            msg: result.message
                        });
                    } else {
                        $.messager.show({
						title : '操作成功',
						msg : result.message
					      });
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function destroyUser() {
		var rows = $('#dg').datagrid('getSelections');
		if (rows.length) {
			var strIds = [];
			for (var i = 0; i < rows.length; i++) {
				strIds.push(rows[i].id);
			}
			var ids = strIds.join(",");
			$.messager.defaults = {
				ok : "确认",
				cancel : "取消"
			};
			$.messager.confirm('确认操作', '你确定要删除你选中的<font style="color:red">'
					+ rows.length + '</font>条信息？', function(r) {
				if (r) {
					$.post('${pageContext.request.contextPath}/userInfo/deleteUser', {
						ids : ids
					}, function(result) {
						if (!result.errorMsg) {
							$.messager.show({
								title : '操作成功',
								msg : '已成功删除<font style="color:red">'+rows.length+'</font>条数据！'
							});
							$('#dg').datagrid('reload'); // reload the user data
						} else {
							$.messager.show({ // show error message
								title : '错误',
								msg : result.errorMsg
							});
						}
					}, 'json');
				}
			});
		}else {
					$.messager.alert("系统提示", "请选择要删除的数据！");
					return;
				}
	}
	
	$('#cc')
	.combobox(
			{
				url : '${pageContext.request.contextPath}/userInfo/getRoleNames',
				valueField : 'id',
				textField : 'rolename'
			});
    </script>