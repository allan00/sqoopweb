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
      <div id="contentBox">
      <center>
       <label><strong>导入源选项：</strong></label></br></br></br>
       <label>数据库类型：</label><select><option value="Mysql" id="DBType" name="DBType">Mysql</option></br></br>
       <option value="Oracle">Oracle</option>
       <option value="DB2">DB2</option></select></br></br>
       <label>主机ip:</label><input type="text" id=“hostIp” name="hostIp"/></br></br>
       <label>端口号：</label><input type="text" id=“port” name="port"/></br></br>
		<label>用户名：</label><input type="text" id="DBUser" name="DBUser"/></br></br>
		<label>密码：</label><input type="password" id="DBPassword" name="DBPassword"/></br></br>
		<label>数据库名：</label><input type="text" id=“schema” name="schema"/></br></br>
		<label>表名：</label><input type="text" id=“tableName” name="tableName"/></br></br>
		<label>where条件</label><input type="text" id="where" name="where"/></br></br>
		
		<label><strong>导入目的选项</strong></label></br></br></br>
		<label>导入位置：</label><input type="text" id="target" name="target"/></br></br>
		<label>列分隔符：</label><input type="text" id="columnSplit" name="columnSplit"/></br></br>
		<label>行分隔符：</label><input type="text" id="rowSplit" name="rowSplit"/></br></br>
		<label><strong>其他</strong></label></br></br></br>
		<label>是否增量导入：</label><input type="radio" name="isIncremental" value="0" checked="checked" />否 
		<input type="radio" name="isIncremental" value="1" />是 </br></br>
		<input type="button" value="执行"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<label>作业名称</label><input type="text" id="jobName" name="jobName"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="保存到系统"/></br>
		
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