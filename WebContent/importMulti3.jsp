<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String message = request.getParameter("message");
	
	String count = request.getParameter("count");
	String DBType1 = request.getParameter("DBType1");
	String hostIp1 = request.getParameter("hostIp1");
	String port1 = request.getParameter("port1");
	String DBUser1 = request.getParameter("DBUser1");
	String DBPassword1 = request.getParameter("DBPassword1");
	String schema1 = request.getParameter("schema1");
	String tableName1 = request.getParameter("tableName1");
	String where1 = request.getParameter("where1");
	
	String DBType2 = request.getParameter("DBType2");
	String hostIp2 = request.getParameter("hostIp2");
	String port2 = request.getParameter("port2");
	String DBUser2 = request.getParameter("DBUser2");
	String DBPassword2 = request.getParameter("DBPassword2");
	String schema2 = request.getParameter("schema2");
	String tableName2 = request.getParameter("tableName2");
	String where2 = request.getParameter("where2");
	
	String DBType3 = request.getParameter("DBType3");
	String hostIp3 = request.getParameter("hostIp3");
	String port3 = request.getParameter("port3");
	String DBUser3 = request.getParameter("DBUser3");
	String DBPassword3 = request.getParameter("DBPassword3");
	String schema3 = request.getParameter("schema3");
	String tableName3 = request.getParameter("tableName3");
	String where3 = request.getParameter("where3");

	String target = request.getParameter("target");
	String columnSplit = request.getParameter("columnSplit");
	String rowSplit = request.getParameter("rowSplit");
	String isIncremental = request.getParameter("isIncremental");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Generated by Apache Maven Doxia at 2016-11-13 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Sqoop - Apache Sqoop 1.44.6</title>
<style type="text/css" media="all">
@import url("./css/maven-base.css");

@import url("./css/maven-theme.css");

@import url("./css/site.css");
</style>
<link rel="stylesheet" href="./css/print.css" type="text/css"
	media="print" />
<meta name="Date-Revision-yyyymmdd" content="20161113" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body class="composite">
	<div id="banner">
		<a href="http://sqoop.apache.org/" id="bannerLeft"> <img
			src="images/sqoop-logo.png" alt="" />
		</a> <a href="http://www.apache.org/" id="bannerRight"> <img
			src="http://www.apache.org/images/asf_logo_wide.png" alt="" />
		</a>
		<div class="clear">
			<hr />
		</div>
	</div>
	<div id="breadcrumbs">

		<div class="xleft">
			<a href="<%=path%>/index.jsp" class="externalLink">首页</a> &gt; <a
				href="<%=path%>/savedJobList" class="externalLink">作业状态/已保存作业</a>
		</div>
		<div class="xright">
			<a href="http://wiki.apache.org/sqoop" class="externalLink">Wiki</a>
			| <a href="https://svn.apache.org/repos/asf/sqoop/"
				class="externalLink">SVN</a> &nbsp;| Last Modified: 2016-04-15
			&nbsp;| Version: 1.44.6
		</div>
		<div class="clear">
			<hr />
		</div>
	</div>
	<%@include file="/left.jsp"%>
	<div id="bodyColumn">
		<div id="contentBox">
		<h3>新建多源导入作业</h3>
			<center>
				<form id="importForm" name="importForm" action="<%=path%>/execImportMulti" method="post">
				<input type="text" id="count" name="count" value="<%=count%>" hidden="true"/>
				
				<div id="source1" name="source1" class="source" style="border:dotted 1px grey;" hidden="true">
      <table align="center" style="width:240px;" >
       <tr><td><strong>导入源(1)：</strong></td></tr>
       <tr><td></td></tr>
       <tr><td>数据库类型：</td><td><input type="text" id="DBType1" name="DBType1" value="<%=DBType1%>"/></td></tr>
       <tr><td>主机ip:</td><td><input type="text" id="hostIp1" name="hostIp1" value="<%=hostIp1%>"/></td></tr>
       <tr><td>端口号：</td><td><input type="text" id="port1" name="port1" value="<%=port1%>"/></td></tr>
		<tr><td>用户名：</td><td><input type="text" id="DBUser1" name="DBUser1" value="<%=DBUser1%>"/></td></tr>
		<tr><td>密码：</td><td><input type="password" id="DBPassword1" name="DBPassword1" value="<%=DBPassword1%>"/></td></tr>
		<tr><td>数据库名：</td><td><input type="text" id="schema1" name="schema1" value="<%=schema1%>"/></td></tr>
		<tr><td>表名：</td><td><input type="text" id="tableName1" name="tableName1" value="<%=tableName1%>"/></td></tr>
		<tr><td>where条件</td><td><input type="text" id="where1" name="where1" value="<%=where1%>"/></td></tr>
		</table></br>
		</div>
		<div id="source2" name="source2" class="source" style="border:dotted 1px grey;" hidden="true">
      <table align="center" style="width:240px;">
       <tr><td><strong>导入源(2)：</strong></td></tr>
       <tr><td></td></tr>
       <tr><td>数据库类型：</td><td><input type="text" id="DBType2" name="DBType2" value="<%=DBType2%>"/></td></tr>
       <tr><td>主机ip:</td><td><input type="text" id="hostIp2" name="hostIp2" value="<%=hostIp2%>"/></td></tr>
       <tr><td>端口号：</td><td><input type="text" id="port2" name="port2" value="<%=port2%>"/></td></tr>
		<tr><td>用户名：</td><td><input type="text" id="DBUser2" name="DBUser2" value="<%=DBUser2%>"/></td></tr>
		<tr><td>密码：</td><td><input type="password" id="DBPassword2" name="DBPassword2" value="<%=DBPassword2%>"/></td></tr>
		<tr><td>数据库名：</td><td><input type="text" id="schema2" name="schema2" value="<%=schema2%>"/></td></tr>
		<tr><td>表名：</td><td><input type="text" id="tableName2" name="tableName2" value="<%=tableName2%>"/></td></tr>
		<tr><td>where条件</td><td><input type="text" id="where2" name="where2" value="<%=where2%>"/></td></tr>
		</table></br>
		</div>
		<div id="source3" name="source3" class="source" style="border:dotted 1px grey;" hidden="true">
      <table align="center" style="width:240px;">
       <tr><td><strong>导入源(3)：</strong></td></tr>
       <tr><td></td></tr>
       <tr><td>数据库类型：</td><td><input type="text" id="DBType3" name="DBType3" value="<%=DBType3%>"/></td></tr>
       <tr><td>主机ip:</td><td><input type="text" id="hostIp3" name="hostIp3" value="<%=hostIp3%>"/></td></tr>
       <tr><td>端口号：</td><td><input type="text" id="port3" name="port3" value="<%=port3%>"/></td></tr>
		<tr><td>用户名：</td><td><input type="text" id="DBUser3" name="DBUser3" value="<%=DBUser3%>"/></td></tr>
		<tr><td>密码：</td><td><input type="password" id="DBPassword3" name="DBPassword3" value="<%=DBPassword3%>"/></td></tr>
		<tr><td>数据库名：</td><td><input type="text" id="schema3" name="schema3" value="<%=schema3%>"/></td></tr>
		<tr><td>表名：</td><td><input type="text" id="tableName3" name="tableName3" value="<%=tableName3%>"/></td></tr>
		<tr><td>where条件</td><td><input type="text" id="where3" name="where3" value="<%=where3%>"/></td></tr>
		</table></br>
		</div>
				<table align="center" style="width: 35%; margin: auto" hidden="true">
						<tr>
							<td><strong>二、导入目的选项</strong></td>
						</tr>
						<tr>
							<td></br></td>
						</tr>
						<tr>
							<td>导入位置：<input type="text" id="target" name="target" value="<%=target%>"/></td>
						</tr>
						<tr>
							<td>列分隔符：<input type="text" id="columnSplit" name="columnSplit" value="<%=columnSplit%>"/></td>
						</tr>
						<tr>
							<td>行分隔符：<input type="text" id="rowSplit" name="rowSplit" value="<%=rowSplit%>"/></td>
						</tr>
						<tr>
							<td></br>
							<strong>其他</strong></td>
						</tr>
						<tr>
							<td>是否增量导入：<input type="text" id="isIncremental" name="isIncremental" value="<%=isIncremental%>"/>
							</td>
						</tr>
					</table>
					<table align="center" style="width: 35%; margin: auto">				
						<tr>
							<td><strong>三、作业执行</strong></td>
						</tr>
						<tr>
							<td></br><label>作业名称</label> <input type="text" id="jobName"
								name="jobName" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
								value="保存并执行"  onclick="return save_submit()"/></td>
						</tr>
						<tr>
							<td></br></br><input type="button" value="上一步" onclick="history.go(-1)" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="直接执行" />&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</form>
			</center>
		</div>
	</div>
	<div class="clear">
		<hr />
	</div>
	<div id="footer">
		<div class="xright">
			&#169; 2016 South China Normal University - <a
				href="http://maven.apache.org/privacy-policy.html">Privacy
				Policy</a>
		</div>
		<div class="clear">
			<hr />
		</div>
	</div>
	
	<script>
function checkForm(){
    /* var username = importForm.username.value;
    var password = importForm.password.value;
		
	   if(username==""||username==null){
		alert("用户名不能为空");
		document.getElementById("username").value="";
		document.getElementById("username").focus();	
		return false;
		}
	   if(password==""||password==null){
		alert('密码不能为空');
		document.getElementById("password").value="";
		document.getElementById("password").focus();
		return false;
	}	 */
	return true;
}
function save_submit(){
	if(checkForm()==false){
		return false;
	}
		
	var importForm = document.getElementById("importForm");
	importForm.action="<%=path%>/saveAndExecImportMulti";
	importForm.submit();
}
</script>
</body>
</html>