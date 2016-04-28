<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
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
.source{float:left;margin-left:37px;margin-top:40px;}
td{word-wrap:break-word;}
</style>
    <link rel="stylesheet" href="./css/print.css" type="text/css" media="print" />
        <meta name="Date-Revision-yyyymmdd" content="20161113" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      </head>
  <body class="composite">
<script type="text/javascript">
var i = 1;
function addSource(dvID)
{
	if(i>=3){
		alert("最多3个数据源");
		return;
	}
	i++;
  var dv = document.getElementById(dvID);
  var insertText = '\
<div id="source_i" name="source_i" class="source" style="border:dotted 1px grey;">\
<table align="center" style="width:240px;">\
<tr><td><strong>导入源(_i)：</strong></td></tr>\
<tr><td></td></tr>\
<tr><td>数据库类型：</td><td><select id="DBType_i" name="DBType_i"><option value="mysql">Mysql</option>\
<option value="oracle">Oracle</option>\
<option value="db2">DB2</option></select></td></tr>\
<tr><td>主机ip:</td><td><input type="text" id="hostIp_i" name="hostIp_i"/></td></tr>\
<tr><td>端口号：</td><td><input type="text" id="port_i" name="port_i"/></td></tr>\
<tr><td>用户名：</td><td><input type="text" id="DBUser_i" name="DBUser_i"/></td></tr>\
<tr><td>密码：</td><td><input type="password" id="DBPassword_i" name="DBPassword_i"/></td></tr>\
<tr><td>数据库名：</td><td><input type="text" id="schema_i" name="schema_i"/></td></tr>\
<tr><td>表名：</td><td><input type="text" id="tableName_i" name="tableName_i"/></td></tr>\
<tr><td>where条件</td><td><input type="text" id="where_i" name="where_i"/></td></tr>\
</table></br></div>\
 ';
 	insertText = insertText.replace(new RegExp("_i","gm"),i);
 /* 	alert(insertText);  */
 	dv.innerHTML = dv.innerHTML+insertText;
}
function removeSource(dvID)
{
	if(i<=1){
		alert("不能继续移除");
		return;
	}
  var source = document.getElementById("source"+i);
  source.parentNode.removeChild(source);
  i--;
}		
</script>
  
    <div id="banner">
                  <a href="http://sqoop.apache.org/" id="bannerLeft">
                                        <img src="images/sqoop-logo.png" alt="" />
                </a>
                        <a href="http://www.apache.org/" id="bannerRight">
                                        <img src="http://www.apache.org/images/asf_logo_wide.png" alt="" />
                </a>
            <div class="clear">
        <hr/>
      </div>
    </div>
    <div id="breadcrumbs">
            
                                <div class="xleft">
                          <a href="<%=path %>/index.jsp" class="externalLink">首页</a>
                &gt;
                      <a href="<%=path %>/savedJobList" class="externalLink">作业状态/已保存作业</a>
                  </div>
            <div class="xright">            <a href="http://wiki.apache.org/sqoop" class="externalLink">Wiki</a>
            |
                <a href="https://svn.apache.org/repos/asf/sqoop/" class="externalLink">SVN</a>
              
                                &nbsp;| Last Modified: 2016-04-15
              &nbsp;| Version: 1.44.6
            </div>
      <div class="clear">
        <hr/>
      </div>
    </div>
    <%@include file="/left.jsp"%>
    <div id="bodyColumn">
      <div id="contentBox" style="text-align:center">
      <h3>新建多源导入作业</h3>
      <center>
      <strong>一、导入源选项：</strong></br></br></br>
      <form action="<%=path %>/importMulti2.jsp" method="post">
      <input type="button" value="添加导入源"  onclick="addSource('sources')"/>
      <input type="button" value="删除导入源"  onclick="removeSource('sources')"/>
				<input type="submit" value="下一步"/>		
      <div id="sources" name="sources">
      <div id="source1" name="source1" class="source" style="border:dotted 1px grey;">
      <table align="center" style="width:240px;">
       <tr><td><strong>导入源(1)：</strong></td></tr>
       <tr><td></td></tr>
       <tr><td>数据库类型：</td><td><select id="DBType1" name="DBType1"><option value="mysql">Mysql</option>
       <option value="oracle">Oracle</option>
       <option value="db2">DB2</option></select></td></tr>
       <tr><td>主机ip:</td><td><input type="text" id="hostIp1" name="hostIp1"/></td></tr>
       <tr><td>端口号：</td><td><input type="text" id="port1" name="port1"/></td></tr>
		<tr><td>用户名：</td><td><input type="text" id="DBUser1" name="DBUser1"/></td></tr>
		<tr><td>密码：</td><td><input type="password" id="DBPassword1" name="DBPassword1"/></td></tr>
		<tr><td>数据库名：</td><td><input type="text" id="schema1" name="schema1"/></td></tr>
		<tr><td>表名：</td><td><input type="text" id="tableName1" name="tableName1"/></td></tr>
		<tr><td>where条件</td><td><input type="text" id="where1" name="where1"/></td></tr>
		</table></br>
		</div>
		
		</div>
		</form>
		</center>
       </div>
    </div>
    <div class="clear"> 
      <hr/>
    </div>
    <div id="footer">
      <div class="xright">&#169;            2016
              South China Normal University
            
                       - <a href="http://maven.apache.org/privacy-policy.html">Privacy Policy</a></div>
      <div class="clear">
        <hr/>
      </div>
    </div>
  </body>
</html>