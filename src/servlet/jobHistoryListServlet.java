package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Job;
import util.JdbcUtil;
import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  


public class jobHistoryListServlet extends HttpServlet {

	public jobHistoryListServlet() {
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
		List<Job> jobList = null;
		jobList = getJobList(request,response);
		request.setAttribute("jobList", jobList);
		request.getRequestDispatcher("/jobHistoryList.jsp").forward(request, response);
		return;
	} 
	
	public List<Job> getJobList(HttpServletRequest request, HttpServletResponse response) {
		List<Job> list = new ArrayList<Job>();
		Statement statement = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			con = JdbcUtil.getConn();
			statement = con.createStatement();
			String sql = "select * from SQOOP_JOB where state!=0 order by id desc";
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				Job o = new Job();
				o.setId(rs.getInt("id"));
				o.setJobName(rs.getString("jobName"));
				o.setType(rs.getInt("type"));
				o.setStartTime(rs.getTimestamp("startTime"));
				o.setEndTime(rs.getTimestamp("endTime"));
				o.setMrID(rs.getString("mrID"));
				o.setLogFileName(rs.getString("logFileName"));
				o.setState(rs.getInt("state"));
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
