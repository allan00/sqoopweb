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
    <title>作业-已保存作业</title>
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
       <h3>已保存作业</h3>
<table border="1px">
<tr>
<td>作业名称</td><td>类型</td><td>创建时间</td><td>操作</td>
</tr>
<c:forEach var="map" items="${jobList}">
    <tr>
      <td >&nbsp;${map.jobName}</td>
      <td >&nbsp;${map.type}</td>
      <td >&nbsp;</td>
      <td>
      <a href="<%=path %>/execSavedJob?id=${map.jobName }"  onclick="">执行</a>
 				<a href="<%=path %>/jobDetail?id=${map.jobName }"  onclick="">查看</a>
      <a href="<%=path %>/jobDelete?id=${map.jobName }"  onclick="
 if(confirm('你确定要删除吗?')){	
		
	}else{
		return false;
		}	

 "}">删除</a>
        </td>
      </tr>
</c:forEach>
</table>
       </div>
    </div>
    <div class="clear">
      <hr/>
    </div>
    <%@include file="/footer.jsp"%>
  </body>
</html>