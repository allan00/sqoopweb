package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
import java.sql.Timestamp;

public class jobExecServlet extends HttpServlet {

	public jobExecServlet() {
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
		try {
			exec(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
	
	public void exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String jobName = request.getParameter("id");
		if(jobName==null || jobName.equals(""))
			return;
		
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		long generate_id = 0;
		Timestamp startTime = new Timestamp(System.currentTimeMillis());
		String logFileName = util.returnDate()+"job-"+jobName+".log";
		try {
			con = JdbcUtil.getConn();
			String sql = "insert into SQOOP_JOB(jobName,startTime,logFileName,state) values(?,?,?,?)";
			ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, jobName);
			ps.setTimestamp(2, startTime);
			ps.setString(3, logFileName);
			ps.setInt(4, 0); 
			int i = ps.executeUpdate();
			
			rs = ps.getGeneratedKeys();
			if (rs.next())
				generate_id=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(rs, ps);
		}
		request.getRequestDispatcher("/runningJobList").forward(request, response);
		
		String cmd = "sqoop job --meta-connect "+util.getMetaURL()+" --exec "+jobName;
		Process p = null;
		OutputStream os = null;
		BufferedReader br = null;
		InputStreamReader isr = null;
		InputStream is = null;
		Runtime rt = Runtime.getRuntime();
		int exitValue = 1;
		try {
			p = rt.exec(cmd);
			is = p.getInputStream();
			if (is == null) {
				exitValue = 1;
			}
			isr = new InputStreamReader(is);
			String logDir = request.getRealPath("/joblog/");
			File logpath = new File(logDir);
			if (!logpath.exists()) {
				logpath.mkdirs();
			}
			File logFile = new File(logDir+ File.separator+logFileName);
			os = new FileOutputStream(logFile);
			br = new BufferedReader(isr);
			String line = "";
			System.out.println(new File("test").getAbsolutePath());
			while ((line = br.readLine()) != null) {
				os.write(line.getBytes());
				os.write("\n".getBytes());
				System.out.println(line);
			}
			
			exitValue = p.waitFor();
			p.destroy();
			
//			System.out.println(exitValue);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		finally{
			br.close();
			isr.close();
			is.close();
			os.flush();
			os.close();
		}
		
		Timestamp endTime = new Timestamp(System.currentTimeMillis());
		int state = 1;
		try {
			String sql = "update SQOOP_JOB set endTime=?,state = ? where id=?";
			ps = con.prepareStatement(sql);
			ps.setTimestamp(1, endTime);
			ps.setInt(2, state);
			ps.setLong(3, generate_id);
			ps.executeUpdate();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		
		return;
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
