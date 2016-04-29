package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import util.Constants;
import util.JdbcUtil;
import util.util;
import java.sql.Connection;    
import java.sql.PreparedStatement;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
import java.sql.Timestamp;

public class execHDFSTransferServlet extends HttpServlet {
	public static final Log LOG = LogFactory.getLog(execHDFSTransferServlet.class.getName());
	public execHDFSTransferServlet() {
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
		String jobName = util.returnDate()+"job";
		String logFileName = jobName+".log";
		String _CMD = parseCMD(request,response);
		String cmd = _CMD+" >"+request.getRealPath("")+Constants.LOG_DIR+"/"+logFileName+" 2>&1";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		long generate_id = 0;
		Timestamp startTime = new Timestamp(System.currentTimeMillis());
		
		try {
			con = JdbcUtil.getConn();
			String sql = "insert into SQOOP_JOB(jobName,startTime,logFileName,state,type) values(?,?,?,?,?)";
			ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, jobName);
			ps.setTimestamp(2, startTime);
			ps.setString(3, logFileName);
			ps.setInt(4, 0); 
			ps.setInt(5, Constants.HDFS_TRANSFER); 
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
		commitCMD(generate_id,logFileName,cmd);//把任务提交给服务器
		return;
	}

	private void commitCMD(long generate_id, String logFileName, String cmd) {
		Socket client = null;
		try {
			client = new Socket("127.0.0.1",20005);
			client.setSoTimeout(10000);
			String info= String.format("id:{%d},type:{%d},logFileName:{%s},cmd:{%s}", generate_id,Constants.HDFS_TRANSFER,logFileName,cmd);
			sendInfo(client,info);
			Thread.sleep(100L);
			info = receiveInfo(client);
			if (!("command valid,executing cmd").equals(info)) {
					throw new Exception(info);
			}
			
		} catch (SocketTimeoutException e) {
			System.out.println("Time out, No response");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (client != null) {
				// 如果构造函数建立起了连接，则关闭套接字，如果没有建立起连接，自然不用关闭
				try {
					client.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 只关闭socket，其关联的输入输出流也会被关闭
			}
		}
		
	}

	private String parseCMD(HttpServletRequest request, HttpServletResponse response) {
		String cmd = null;
		String hostIp1 = request.getParameter("hostIp1");
		String port1 = request.getParameter("port1");
		String target1 = request.getParameter("target1");
		String hostIp2 = request.getParameter("hostIp2");
		String port2 = request.getParameter("port2");
		String target2 = request.getParameter("target2");
		String overwrite = request.getParameter("overwrite");
		if(overwrite!=null && overwrite.equals("1"))
		{
			cmd =String.format("hadoop distcp -overwrite hdfs://%s:%s%s hdfs://%s:%s%s", hostIp1,port1,target1,hostIp2,port2,target2);
		}
		else {
			cmd =String.format("hadoop distcp hdfs://%s:%s%s hdfs://%s:%s%s", hostIp1,port1,target1,hostIp2,port2,target2);
		}
		return cmd;
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	public static String receiveInfo(Socket sock) throws Exception // 读取服务端的反馈信息
	{
		InputStream sockIn = sock.getInputStream(); // 定义socket输入流
		byte[] bufIn = new byte[1024];
		int lenIn = sockIn.read(bufIn); // 将服务端返回的信息写入bufIn字节缓冲区
		if (lenIn == -1)
			return "";
		String info = new String(bufIn, 0, lenIn, "utf-8");
		LOG.debug("receive<----" + info);
		return info;
	}

	public static void sendInfo(Socket sock, String infoStr) throws Exception// 将信息反馈给服务端
	{
		OutputStream sockOut = sock.getOutputStream();
		sockOut.write(infoStr.getBytes("utf-8"));
		LOG.debug("send---->" + infoStr);
	}

}
