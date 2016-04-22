package listener;

import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import util.ServerThread;

public class SqoopCMDListener implements ServletContextListener {
	private java.util.Timer timer = null;
	 @Override
	 public void contextDestroyed(ServletContextEvent event) {
	  timer.cancel();
	  event.getServletContext().log("定时器销毁");
	 }

	 @Override
	 public void contextInitialized(ServletContextEvent event) {
		 new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					listenSqoopCMD();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}).start();
	 }
	
	public void listenSqoopCMD() throws Exception{
		//服务端在20006端口监听客户端请求的TCP连接
		ServerSocket server = new ServerSocket(20006);
		Socket client = null;
		boolean f = true;
		while(f){
			//等待客户端的连接，如果没有获取连接
			client = server.accept();
			System.out.println(client.getInetAddress()+"与客户端连接成功！");
			//为每个客户端连接开启一个线程
			new ServerThread(client).start();
		}
		server.close();
	}
}