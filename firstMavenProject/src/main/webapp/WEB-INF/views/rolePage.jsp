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
<table id="dg" title="角色操作" class="easyui-datagrid"
       style="width:100%;height:100%"
       url="${pageContext.request.contextPath}/roleInfo/queryRole"
       toolbar="#toolbar" pagination="true" singleSelect="true" rownumbers="true"
       fitColumns="true">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="50">编号</th>
        <th field="rolename" width="50">角色名称</th>
        <th field="description" width="50">角色描述</th>
        <th field="_operate" width="20" align="center" formatter="formatOper">操作</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton"
       iconCls="icon-add" plain="true" onclick="newRole()">添加</a> <a
        href="javascript:void(0)" class="easyui-linkbutton"
        iconCls="icon-edit" plain="true" onclick="editRole()">修改</a> <a
        href="javascript:void(0)" class="easyui-linkbutton"
        iconCls="icon-remove" plain="true" onclick="destroyRole()">删除</a>
    <div style="float: right;">
        <input class="easyui-searchbox" data-options="prompt:'请输入角色名查询...',searcher:doSearch" style="width:300px"></input>
    </div>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post" novalidate
          style="margin:0;padding:20px 50px">
        <div
                style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">角色信息</div>
        <div style="margin-bottom:10px">
            <input name="id" type="hidden">
        </div>
        <div style="margin-bottom:10px">
            <input name="rolename" class="easyui-textbox" required="true"
                   label="角色名称:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="description" class="easyui-textbox"
                   data-options="multiline:true" label="角色描述:"
                   style="width:100%;height:100px">
        </div>
    </form>
</div>
<div id="win" closed="true">
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6"
       iconCls="icon-ok" onclick="saveRole()" style="width:90px">保存</a> <a
        href="javascript:void(0)" class="easyui-linkbutton"
        iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
        style="width:90px">取消</a>
</div>
<%--menu--%>
<script type="text/javascript">
    var url;
    function doSearch(value){
        var rolename = value;
        $('#dg').datagrid('load', {
            "rolename" : rolename,
        });
    }
    function newRole(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加角色');
        $('#fm').form('clear');
        url = '${pageContext.request.contextPath}/roleInfo/addRole';
    }
    function editRole(){
        var row = $('#dg').datagrid('getSelections');
        if (row.length == 1){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改角色信息');
            $('#fm').form('load',row[0]);
            url = '${pageContext.request.contextPath}/roleInfo/updateRole';
        }else{
            $.messager.alert("系统提示", "请选择一条要编辑的数据！");
            return;
        }
    }

    function saveRole(){
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
    function destroyRole() {
        var rows = $('#dg').datagrid('getSelections');
        if (rows.length==1) {
            $.messager.defaults = {
                ok : "确认",
                cancel : "取消"
            };
            $.messager.confirm('确认操作', '你确定要删除你选中的信息？', function(r) {
                if (r) {
                    $.post('${pageContext.request.contextPath}/roleInfo/deleteRole', {
                        id : rows[0].id
                    }, function(result) {
                        if (!result.errMSG) {
                            $.messager.show({
                                title : '操作成功',
                                msg : '已成功删除该角色！'
                            });
                            $('#dg').datagrid('reload'); // reload the user data
                        } else {
                            $.messager.show({ // show error message
                                title : '错误',
                                msg : result.errMSG
                            });
                        }
                    }, 'json');
                }
            });
        } else {
            $.messager.alert("系统提示", "请选择要删除的数据！");
            return;
        }
    }

    function formatOper(val, row, index) {
        return "<a href='javascript:void(0)' onclick=" + "'viewUser(&quot;" + row.id + "&quot;)'>查看用户</a>"+
        " <a href='javascript:void(0)' onclick=" + "'viewMenu(&quot;" + row.id + "&quot;)'>查看菜单</a>";
    }
    function viewUser(roleid) {
        $('#win').window({
            width:600,
            height:400,
            title:'角色用户',
            modal:true
        });
        $('#win').window('open');
        $('#win').window('refresh', '${pageContext.request.contextPath}/userInfo/toRoleUserPage?roleid='+roleid);
    }
    function viewMenu(roleid) {
        $('#win').window({
            width:600,
            height:400,
            title:'角色菜单',
            modal:true
        });
        $('#win').window('open');
        $('#win').window('refresh', '${pageContext.request.contextPath}/userInfo/toRoleMenuPage?roleid='+roleid);
    }

</script>