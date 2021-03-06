<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String message = request.getParameter("message");
	String DBType = request.getParameter("DBType");
	String hostIp = request.getParameter("hostIp");
	String port = request.getParameter("port");
	String DBUser = request.getParameter("DBUser");
	String DBPassword = request.getParameter("DBPassword");
	String schema = request.getParameter("schema");
	String tableName = request.getParameter("tableName");
	String where = request.getParameter("where");
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
    <link rel="stylesheet" href="./css/print.css" type="text/css" media="print" />
        <meta name="Date-Revision-yyyymmdd" content="20161113" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      </head>
  <body class="composite">
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
      <div id="contentBox">
      <h3>新建导出作业</h3>
      <center>
      <form action="<%=path %>/export3.jsp" method="post">
      <table align="center" style="width: 35%;margin:auto">
      <label hidden="true"><strong>一、导入源选项</strong></label>
						<label hidden="true">导入位置：</label>
						<input type="text" id="target" name="target" value="${target }" hidden="true" />
						<label hidden="true">列分隔符：</label>
						<input type="text" id="columnSplit" name="columnSplit" value="${columnSplit }"
							hidden="true" />
						<label hidden="true">行分隔符：</label>
						<input type="text" id="rowSplit" name="rowSplit" value="${rowSplit }" hidden="true" />
						
       <tr><td><strong>二、导出目的选项：</strong></td></tr>
       <tr><td></td></tr>
       <tr><td>数据库类型：</td><td><select id="DBType" name="DBType"><option value="mysql">Mysql</option>
       <option value="oracle">Oracle</option>
       <option value="db2">DB2</option></select></td></tr>
       <tr><td>主机ip:</td><td><input type="text" id="hostIp" name="hostIp"/></td></tr>
       <tr><td>端口号：</td><td><input type="text" id="port" name="port"/></td></tr>
		<tr><td>用户名：</td><td><input type="text" id="DBUser" name="DBUser"/></td></tr>
		<tr><td>密码：</td><td><input type="password" id="DBPassword" name="DBPassword"/></td></tr>
		<tr><td>数据库名：</td><td><input type="text" id="schema" name="schema"/></td></tr>
		<tr><td>表名：</td><td><input type="text" id="tableName" name="tableName"/></td></tr>
		<tr><td>where条件</td><td><input type="text" id="where" name="where"/></td></tr>
		<tr><td></br><input type="button" value="上一步" onclick="history.go(-1)" />&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="下一步"/>	</td></tr>	
		</table>
		
		</form>
		</center>
       </div>
    </div>
    <div class="clear"> 
      <hr/>
    </div>
    <%@include file="/footer.jsp"%>
  </body>
</html>