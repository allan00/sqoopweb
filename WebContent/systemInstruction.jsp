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
    <title>系统说明</title>
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
                          <a href="http://www.apache.org/" class="externalLink">Apache</a>
                &gt;
                      <a href="http://hadoop.apache.org/" class="externalLink">Hadoop</a>
                  </div>
            <div class="xright">            <a href="http://wiki.apache.org/hadoop" class="externalLink">Wiki</a>
            |
                <a href="https://svn.apache.org/repos/asf/hadoop/" class="externalLink">SVN</a>
              
                                &nbsp;| Last Published: 2014-11-13
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
<h2>系统说明</h2>
<p>Apache Hadoop 2.6.0 is a minor release in the 2.x.y release line, building upon the previous stable release 2.4.1.</p>
<p>Here is a short overview of the major features and improvements.</p>
<ul>
<li><a name="Common">Common</a>
<ul>
<li>Authentication improvements when using an HTTP proxy server. This is useful when accessing WebHDFS via a proxy server.</li>
<li>A new Hadoop metrics sink that allows writing directly to Graphite.</li>
<li><a href="./hadoop-project-dist/hadoop-common/filesystem/index.html">Specification work</a> related to the Hadoop Compatible Filesystem (HCFS) effort.</li></ul></li>
<li><a name="HDFS">HDFS</a>
<ul>
<li>Support for POSIX-style filesystem extended attributes. See the <a href="./hadoop-project-dist/hadoop-hdfs/ExtendedAttributes.html">user documentation</a> for more details.</li>
<li>Using the OfflineImageViewer, clients can now browse an fsimage via the WebHDFS API.</li>
<li>The NFS gateway received a number of supportability improvements and bug fixes. The Hadoop portmapper is no longer required to run the gateway, and the gateway is now able to reject connections from unprivileged ports.</li>
<li>The SecondaryNameNode, JournalNode, and DataNode web UIs have been modernized with HTML5 and Javascript.</li></ul></li>
<li><a name="YARN">YARN</a>
<ul>
<li>YARN's REST APIs now support write/modify operations. Users can submit and kill applications through REST APIs.</li>
<li>The timeline store in YARN, used for storing generic and application-specific information for applications, supports authentication through Kerberos.</li>
<li>The Fair Scheduler supports dynamic hierarchical user queues, user queues are created dynamically at runtime under any specified parent-queue.</li></ul></li></ul></div>
<div class="section">
<h2>Getting Started<a name="Getting_Started"></a></h2>
<p>The Hadoop documentation includes the information you need to get started using Hadoop. Begin with the <a href="./hadoop-project-dist/hadoop-common/SingleCluster.html">Single Node Setup</a> which shows you how to set up a single-node Hadoop installation. Then move on to the <a href="./hadoop-project-dist/hadoop-common/ClusterSetup.html">Cluster Setup</a> to learn how to set up a multi-node Hadoop installation.</p></div>
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