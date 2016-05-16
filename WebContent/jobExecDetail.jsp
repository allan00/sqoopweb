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
    <title>作业-执行状态</title>
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
      <h3>作业执行状态</h3>
作业ID：${job.id }</br></br>
作业名称：${job.jobName }</br></br>
创建时间：${job.startTime }</br></br>
结束时间：${job.endTime }</br></br>
状态：
  <c:choose>
<c:when test="${job.state == 0}">
运行中
</c:when>
<c:when test="${job.state == 1}">
成功
</c:when>
<c:otherwise>
失败
</c:otherwise>
</c:choose>
</br></br>
日志：</br></br><textarea cols='60' rows='20' disabled="disabled"> ${job.logContent }</textarea>

       </div>
    </div>
    <div class="clear">
      <hr/>
    </div>
    <%@include file="/footer.jsp"%>
  </body>
</html>