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


public class indexInfoServlet extends HttpServlet {

	public indexInfoServlet() {
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
		getInfo(request,response);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		return;
	} 
	
	public void getInfo(HttpServletRequest request, HttpServletResponse response) {
		int runningNum = 0;
		int historyNum = 0;
		int success = 0;
		int fail = 0;
		
		Statement statement = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			con = JdbcUtil.getConn();
			statement = con.createStatement();
			String sql = "select count(*) from SQOOP_JOB where state=0";
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				runningNum = rs.getInt(1);
			}
			rs.close();
			
			sql = "select count(*) from SQOOP_JOB where state!=0";
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				historyNum = rs.getInt(1);
			}
			rs.close();
			
			
			sql = "select count(*) from SQOOP_JOB where state=1";
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				success = rs.getInt(1);
			}
			rs.close();
			
			
			sql = "select count(*) from SQOOP_JOB where state=2";
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				fail = rs.getInt(1);
			}
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(null, statement);
			JdbcUtil.closeConnection(con);
		}
		request.getSession().setAttribute("runningNum", runningNum);
		request.getSession().setAttribute("historyNum", historyNum);
		request.getSession().setAttribute("success", success);
		request.getSession().setAttribute("fail", fail);
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
