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

import com.cloudera.sqoop.SqoopOptions;
import com.cloudera.sqoop.tool.SqoopTool;

import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

public class jobCreateAndExecServlet extends HttpServlet {

	public jobCreateAndExecServlet() {
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
		List<String> jobList = null;
		jobList();
		request.getRequestDispatcher("/jobList.jsp").forward(request, response);
		return;
	} 
	
	public void jobList() {
		String cmd = "sqoop job --create test0103 --  import --direct  --connect jdbc:mysql://db:3306/gszxglzx --username root --password root --table table_0101";
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
