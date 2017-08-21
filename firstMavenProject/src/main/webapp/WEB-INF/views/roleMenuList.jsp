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
<table id="tg" class="easyui-treegrid" style="width:100%;height:100%"
        data-options="
				url: '${pageContext.request.contextPath}/menuInfo/getRoleMenus?roleid=${param.roleid}',
				method: 'get',
				rownumbers: true,
				animate:true,
				toolbar:'#toolbar1',
				idField: 'id',
				treeField: 'text'
			">
    <thead>
    <tr>
        <th data-options="field:'text'" width="30%">菜单</th>
        <th data-options="field:'url'" width="40%" >URI</th>
        <th data-options="field:'pid'" width="30%">父节点</th>
    </tr>
    </thead>
</table>
    <div id="toolbar1">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addMenus()">添加菜单</a>
    </div>
    <div id="dlg1" class="easyui-dialog" style="width:300px" closed="true"
         buttons="#dlg1-buttons">
        <form id="fm1" method="post" novalidate
              style="margin:0;padding:20px 50px">
            <div
                    style="margin-bottom:30px;font-size:14px;border-bottom:1px solid #ccc">菜单信息</div>
            <div style="margin-bottom:50px">
                <ul id="menuTree" name="ids" class="easyui-tree" checkbox="true"
                    style="border: none; wight:100%;state:open">
                </ul>
            </div>
            <div style="margin-bottom: 30px;display:none">
                <input type="text" name="ids" class="easyui-textbox" id="ids"
                       label="菜单ID：" style="width: 50%" />
            </div>
        </form>
    </div>
    <div id="dlg1-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6"
           iconCls="icon-ok" onclick="save()" style="width:90px">保存</a> <a
            href="javascript:void(0)" class="easyui-linkbutton"
            iconCls="icon-cancel" onclick="javascript:$('#dlg1').dialog('close')"
            style="width:90px">取消</a>
    </div>
<script type="text/javascript">
    function addMenus(){
            $('#dlg1').dialog('open').dialog('center').dialog('setTitle','菜单');
            $('#fm1').form('clear');
            $('#menuTree').tree({
                url : "${pageContext.request.contextPath}/menuInfo/getAllMenus",
                method : "post",
                animate : true,
                cascadeCheck : false
            });
    }
    function save() {
        var nodes = $('#menuTree').tree('getChecked');
        if (nodes){
            var s = [];
            for (var i = 0; i < nodes.length; i++) {
                s.push(nodes[i].id);
            }
            var ids = s.join(",");
            var roleid = ${param.roleid};
            $.post('${pageContext.request.contextPath}/roleInfo/addMenus',{ids:ids,roleid:roleid},function (result) {
                if (result.code=="errMSG") {
                    $.messager.show({
                        title : '添加失败',
                        msg : result.message
                    });
                } else {
                    $.messager.show({ // show error message
                        title : '添加成功',
                        msg : result.message
                    });
                    $('#dlg1').dialog('close');
                    $('#tg').treegrid('reload');
                }
            },'json')
        }
    }
</script>
</body>
</html>
