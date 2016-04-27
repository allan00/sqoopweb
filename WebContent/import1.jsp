<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Generated by Apache Maven Doxia at 2014-11-13 -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Sqoop - Apache Sqoop 1.44.6</title>
<style type="text/css" media="all">
      @import url("./css/maven-base.css");
      @import url("./css/maven-theme.css");
      @import url("./css/site.css");
</style>
    <link rel="stylesheet" href="./css/print.css" type="text/css" media="print" />
        <meta name="Date-Revision-yyyymmdd" content="20141113" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      </head>
  <body class="composite">
    <div id="banner">
                  <a href="http://hadoop.apache.org/" id="bannerLeft">
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
            <div class="xright">            <a href="http://wiki.apache.org/hadoop" class="externalLink">Wiki</a>
            |
                <a href="https://svn.apache.org/repos/asf/hadoop/" class="externalLink">SVN</a>
              
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
      <center>
      <form action="<%=path %>/import2.jsp" method="post">
      <table align="center" style="width: 35%;margin:auto">
       <tr><td><strong>一、导入源选项：</strong></td></tr>
       <tr><td></br></td></tr>
       <tr><td>数据库类型：</td><td><select id="DBType" name="DBType"><option value="Mysql">Mysql</option>
       <option value="Oracle">Oracle</option>
       <option value="DB2">DB2</option></select></td></tr>
       <tr><td>主机ip:</td><td><input type="text" id="hostIp" name="hostIp"/></td></tr>
       <tr><td>端口号：</td><td><input type="text" id="port" name="port"/></td></tr>
		<tr><td>用户名：</td><td><input type="text" id="DBUser" name="DBUser"/></td></tr>
		<tr><td>密码：</td><td><input type="password" id="DBPassword" name="DBPassword"/></td></tr>
		<tr><td>数据库名：</td><td><input type="text" id="schema" name="schema"/></td></tr>
		<tr><td>表名：</td><td><input type="text" id="tableName" name="tableName"/></td></tr>
		<tr><td>where条件</td><td><input type="text" id="where" name="where"/></td></tr>
		<tr><td></br><input type="submit" value="下一步"/>	</td></tr>	
		</table>
		
		</form>
		</center>
       </div>
    </div>
    <div class="clear"> 
      <hr/>
    </div>
    <div id="footer">
      <div class="xright">&#169;            2014
              Apache Software Foundation
            
                       - <a href="http://maven.apache.org/privacy-policy.html">Privacy Policy</a></div>
      <div class="clear">
        <hr/>
      </div>
    </div>
  </body>
</html>