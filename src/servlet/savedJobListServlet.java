package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SavedJob;

import org.apache.sqoop.Sqoop;
import org.apache.sqoop.tool.JobTool;

import util.JdbcUtil;
import util.util;

import com.cloudera.sqoop.SqoopOptions;
import com.cloudera.sqoop.tool.SqoopTool;

import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

public class savedJobListServlet extends HttpServlet {

	public savedJobListServlet() {
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
		List<SavedJob> jobList = null;
		jobList = getJobList(request,response);
		request.setAttribute("jobList", jobList);
		request.getRequestDispatcher("/savedJobList.jsp").forward(request, response);
		return;
	} 
	
	public List<SavedJob> getJobList(HttpServletRequest request, HttpServletResponse response) {
		List<SavedJob> list = new ArrayList<SavedJob>();
		Statement statement = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "select * from SQOOP_SESSIONS where propname='sqoop.tool'";
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				SavedJob o = new SavedJob();
				o.setJobName(rs.getString("job_name"));
//				o.setType(rs.getString("propname"));
				o.setType(rs.getString("propval"));
				list.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		}
		return list;
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
