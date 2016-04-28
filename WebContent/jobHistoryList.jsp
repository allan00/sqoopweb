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
    <title>作业-作业历史</title>
    <style type="text/css" media="all">
      @import url("./css/maven-base.css");
      @import url("./css/maven-theme.css");
      @import url("./css/site.css");
    </style>
    <style type="text/css">
td{border:solid #add9c0; 
 			border-width:0px 1px 1px 0px;}
table{border:solid #add9c0;
				border-width:1px 0px 0px 1px;}
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
                      <a href="<%=path %>/savedJobList" class="externalLink">作业状态/作业历史</a>
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
       <h3>作业历史</h3>
<table border="1px">
<tr>
<td>作业ID</td><td>作业名称</td><td>类型</td><td>创建时间</td><td>结束时间</td><td>状态</td><td>操作</td>
</tr>
<c:forEach var="map" items="${jobList}">
    <tr>
      <td >&nbsp;${map.id}</td>
      <td >&nbsp;${map.jobName}</td>
      <td>
      <c:choose>
<c:when test="${map.type == 1}">
导入
</c:when>
<c:when test="${map.type == 2}">
导入
</c:when>
<c:when test="${map.type == 3}">
导出
</c:when>
<c:when test="${map.type == 2}">
hdfs迁移
</c:when>
<c:otherwise>
<font color="red">系统作业</font>
</c:otherwise>
</c:choose> 
      </td>
      <td >&nbsp;${map.startTime}</td>
      <td >&nbsp;${map.endTime}</td>
      <td >
      <c:choose>
<c:when test="${map.state == 0}">
<font>运行中</font>
</c:when>
<c:when test="${map.state == 1}">
成功
</c:when>
<c:otherwise>
<font color="red">失败</font>
</c:otherwise>
</c:choose> 
</td>
      
      <td>
 				<a href="<%=path %>/jobExecDetail?id=${map.id }">查看</a>
      </td>
      </tr>
</c:forEach>
</table>
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