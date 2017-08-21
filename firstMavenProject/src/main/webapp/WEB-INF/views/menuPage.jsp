<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/demo/demo.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" type="text/css" src="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js"></script>
<%--<table id="dg" title="菜单信息" class="easyui-datagrid"
	style="width:100%;height:100%"
	url="${pageContext.request.contextPath}/menuInfo/queryMenu"
	toolbar="#toolbar" pagination="true" rownumbers="true"
	fitColumns="true" pageSize="25" pageList=[25,50,100,200]>
	<thead>
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="5">节点</th>
			<th field="text" width="6">菜单名</th>
			<th field="pid" width="6">父节点</th>
			<th field="url" width="6">地址</th>
		</tr>
	</thead>
</table>--%>
<table  class="easyui-treegrid" style="width:100%;height:100%"
	   data-options="
				url: '${pageContext.request.contextPath}/menuInfo/getAllMenus?roleid=${param.roleid}',
				method: 'get',
				rownumbers: true,
				animate:true,
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
<%--
<script type="text/javascript">
	var url;
	function doSearch(value) {
		var text = value;
		$('#dg').datagrid('load', {
			"text" : text,
		});
	}
</script>--%>
