package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.sqoop.Sqoop;
import org.apache.sqoop.tool.JobTool;

import util.util;

import com.cloudera.sqoop.SqoopOptions;
import com.cloudera.sqoop.tool.SqoopTool;

import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

public class saveAndExecImportServlet extends HttpServlet {

	public saveAndExecImportServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String jobName = jobSave(request, response);
		request.getRequestDispatcher("/execSavedJob?id="+jobName).forward(request, response);
		return;
	} 
	
	public String jobSave(HttpServletRequest request, HttpServletResponse response) {
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
//		String isIncremental = request.getParameter("isIncremental");
		String jobName = request.getParameter("jobName");
		
		StringBuilder sb = new StringBuilder(String.format("sqoop job --create %s --meta-connect %s --  import --direct  --connect jdbc:%s://%s:%s/%s --username %s --password %s --table %s",jobName,util.getMetaURL(),DBType,hostIp,port,schema,DBUser,DBPassword,tableName));
		addAttribute(sb, "--where", where);
//		addAttribute(sb, "--target", target);
//		addAttribute(sb, "where", columnSplit);
//		addAttribute(sb, "where", rowSplit);
//		addAttribute(sb, "--append", isIncremental);
		String sqoopCMD =sb.toString();
		String[] cmd = {"/bin/sh","-c",sqoopCMD};
		Runtime rt = Runtime.getRuntime();
		Process p = null;
		int exitValue = 1;
		try {
			p = rt.exec(cmd);
			InputStream is = p.getErrorStream();
			if (is == null) {
				exitValue = 1;
			}
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String line = "";
			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}
			br.close();
			isr.close();
			is.close();
			exitValue = p.waitFor();
			p.destroy();
			System.out.println(exitValue);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return jobName;
	}
	
	private void addAttribute(StringBuilder sb,String name,String value){
		if(value!=null &&value!="")
		{
			sb.append(name+" "+value);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
