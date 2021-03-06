package listener;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.jasper.tagplugins.jstl.core.Otherwise;

import util.Constants;
import util.JdbcUtil;
import util.util;

/**
 * 该类为多线程类，用于服务端
 */
public class ServerThread extends Thread {
	public static final Log LOG = LogFactory.getLog(ServerThread.class.getName());
	private Socket client = null;
	public String realPath = null;

	public ServerThread(Socket client, String realPath) {
		this.client = client;
		this.realPath = realPath;
	}

	@Override
	public void run() {
		try {
			String info = null;
			info = receiveInfo(client);
			if (validateCMD(info)) {
				int id = parseId(info);
				int type = parseType(info);
				String logFileName = parseLogFileName(info);
				String cmd = parseCMD(info);
				info = "command valid,executing cmd";
				LOG.debug("id=" + id + ",logFileName=" + logFileName + ",cmd=" + cmd);
				sendInfo(client, info);

				exec(id, type, logFileName, cmd);

			} else {
				info = "command invalid,connection closed";
				sendInfo(client, info);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				client.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void exec(int id, int type, String logFileName, String cmd) {
		PreparedStatement ps = null;
		Connection con = null;
		Process p = null;
		Runtime rt = Runtime.getRuntime();
		int exitValue = 1;
		try {
			String logDir = realPath + Constants.LOG_DIR;
			File logpath = new File(logDir);
			if (!logpath.exists()) {
				logpath.mkdirs();
			}
			switch (type) {
			case 1: { // 单源导入作业
				String[] linuxCMD = { "/bin/sh", "-c", cmd };
				p = rt.exec(linuxCMD);
				exitValue = p.waitFor();
				p.destroy();
				break;
			}
			case 2: {// 多源导入作业
				String[] cmds = cmd.split(Constants.SPLIT_SYMBOL_REGEX);
				//依次执行作业
				for (int i=0;i<cmds.length;i++) {
					String[] linuxCMD = { "/bin/sh", "-c", cmds[i]+" >"+realPath+Constants.LOG_DIR+"/"+logFileName+" 2>&1" };
					System.out.println(linuxCMD[2]);
					p = rt.exec(linuxCMD);
					exitValue = p.waitFor();
				}
				p.destroy();
				break;
			}
			case 3: { // 导出作业
				String[] linuxCMD = { "/bin/sh", "-c", cmd };
				p = rt.exec(linuxCMD);
				exitValue = p.waitFor();
				p.destroy();
				break;
			}

			case 4: { // HDFS迁移作业
				String[] linuxCMD = { "/bin/sh", "-c", cmd };
				p = rt.exec(linuxCMD);
				exitValue = p.waitFor();
				p.destroy();
				break;
			}
			default: {
				break;
			}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
		}

		Timestamp endTime = new Timestamp(System.currentTimeMillis());
		File logFile = new File(realPath + Constants.LOG_DIR + "/" + logFileName);
		int state = -1;
		if (logFile.exists()) {
			state = util.parseIsSuccess(logFile);
		} else {
			state = 2;
		}
		try {
			String sql = "update SQOOP_JOB set endTime=?,state = ? where id=?";
			con = JdbcUtil.getConn();
			ps = con.prepareStatement(sql);
			ps.setTimestamp(1, endTime);
			ps.setInt(2, state);
			ps.setLong(3, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
	}

	private boolean validateCMD(String info) {
		// TODO Auto-generated method stub
		return true;
	}

	private static int parseId(String info) {
		int start = info.indexOf("id:{") + 4;
		int end = info.indexOf("},type:");
		LOG.info("start=" + start + ",end=" + end);
		int id = Integer.valueOf(info.substring(start, end));
		return id;
	}

	private static int parseType(String info) {
		int start = info.indexOf("type:{") + 6;
		int end = info.indexOf("},logFileName:");
		int type = Integer.valueOf(info.substring(start, end));
		return type;
	}

	private static String parseLogFileName(String info) {
		int start = info.indexOf("logFileName:{") + 13;
		int end = info.indexOf("},cmd:{");
		String logFileName = info.substring(start, end);
		return logFileName;
	}

	private static String parseCMD(String info) {
		int start = info.indexOf("cmd:{") + 5;
		int end = info.length();
		String cmd = info.substring(start, end - 1);
		return cmd;
	}

	public static String receiveInfo(Socket sock) throws Exception // 读取服务端的反馈信息
	{
		InputStream sockIn = sock.getInputStream(); // 定义socket输入流
		byte[] bufIn = new byte[1024];
		int lenIn = sockIn.read(bufIn); // 将服务端返回的信息写入bufIn字节缓冲区
		if (lenIn == -1)
			return "";
		String info = new String(bufIn, 0, lenIn, "utf-8");
		LOG.info("receive<----" + info);
		return info;
	}

	public static void sendInfo(Socket sock, String infoStr) throws Exception// 将信息反馈给服务端
	{
		OutputStream sockOut = sock.getOutputStream();
		sockOut.write(infoStr.getBytes("utf-8"));
		LOG.info("send---->" + infoStr);
	}
}