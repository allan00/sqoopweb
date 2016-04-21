package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Job;

import org.apache.sqoop.Sqoop;
import org.apache.sqoop.tool.JobTool;

import util.Constants;
import util.JdbcUtil;
import util.util;

import com.cloudera.sqoop.SqoopOptions;
import com.cloudera.sqoop.tool.SqoopTool;

import java.sql.Connection;    
import java.sql.PreparedStatement;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
import java.sql.Timestamp;

public class jobExecDetailServlet extends HttpServlet {

	public jobExecDetailServlet() {
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
		
		getDetail(request,response);
		request.getRequestDispatcher("/jobExecDetail.jsp").forward(request, response);
		return;
	} 
	
	public void getDetail(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		long generate_id = 0;
		String logFileName = "";
		String logContent = "";
		FileReader in = null;
		BufferedReader br = null;
		Job job = new Job();
		try {
			con = JdbcUtil.getConn();
			String sql = "select * from SQOOP_JOB where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				job.setId(rs.getInt("id"));
				job.setJobName(rs.getString("jobName"));
				job.setStartTime(rs.getTimestamp("startTime"));
				job.setEndTime(rs.getTimestamp("endTime"));
				job.setMrID(rs.getString("mrID"));
				logFileName = rs.getString("logFileName");
				job.setLogFileName(logFileName);
				job.setState(rs.getInt("state"));
				File logFile = new File(request.getRealPath("")+Constants.LOG_DIR+"/"+logFileName);
				if(logFile.exists()){
					in = new FileReader(logFile);
					br = new BufferedReader(in);
					String line;
					while((line=br.readLine())!=null){
						logContent += line+"\n";
					}
					in.close();
					br.close();
				}
				else{
					logContent = "无日志";
				}
				job.setLogContent(logContent);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(rs, ps);
		}
		request.setAttribute("job", job);
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
