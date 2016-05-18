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
    <title>单源导入教程</title>
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
                          <a href="http://www.apache.org/" class="externalLink">Apache</a>
                &gt;
                      <a href="http://sqoop.apache.org/" class="externalLink">sqoop</a>
                  </div>
            <div class="xright">            <a href="http://wiki.apache.org/sqoop" class="externalLink">Wiki</a>
            |
                <a href="https://svn.apache.org/repos/asf/sqoop/" class="externalLink">SVN</a>
              
                                &nbsp;| Last Published: 2016-11-13
              &nbsp;| Version: 2.6.0
            </div>
      <div class="clear">
        <hr/>
      </div>
    </div>
 <%@include file="/left.jsp"%>
    <div id="bodyColumn">
      <div id="contentBox">
        <!-- Licensed under the Apache License, Version 2.0 (the "License"); --><!-- you may not use this file except in compliance with the License. --><!-- You may obtain a copy of the License at --><!--  --><!-- http://www.apache.org/licenses/LICENSE-2.0 --><!--  --><!-- Unless required by applicable law or agreed to in writing, software --><!-- distributed under the License is distributed on an "AS IS" BASIS, --><!-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. --><!-- See the License for the specific language governing permissions and --><!-- limitations under the License. See accompanying LICENSE file. --><div class="section">
<h2>单源导入教程</h2>
将单一源的数据导入到大数据平台。当需要将数据从“一个”特定的关系型数据库导入到Hadoop平台时可以新建此作业。</br>

新建步骤如下</br>

一、	选择导入源的关系数据库的参数。包括数据库类型（MySql、Oracle等）、主机ip地址、端口号、用户名、密码、数据库名、表名、筛选条件。</br>
<center><img src="<%=path %>/images/help/import1.png" alt="" /></center></br></br></br></br></br></br>
二、	选择数据导入到Hadoop平台的列分隔符、行分隔符以及目标位置。</br>
<center><img src="<%=path %>/images/help/import2.png" alt="" /></center></br></br></br></br></br></br>
三、	选择是否执行增量导入</br>
<center><img src="<%=path %>/images/help/import3.png" alt="" /></center></br></br></br></br></br></br>
四、	选择直接执行作业，或者将作业参数保存到系统中，以便下次直接执行此作业。</br>
<center><img src="<%=path %>/images/help/import4.png" alt="" /></center></br></br></br></br></br></br>
</div>
      </div>
    </div>
    <div class="clear">
      <hr/>
    </div>
    <%@include file="/footer.jsp"%>
  </body>
</html>