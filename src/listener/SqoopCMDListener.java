package listener;

import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import util.Constants;


public class SqoopCMDListener implements ServletContextListener {
	public static final Log LOG = LogFactory.getLog(SqoopCMDListener.class.getName());
	private static final ExecutorService es = Executors.newCachedThreadPool(); 
	 @Override
	 public void contextDestroyed(ServletContextEvent event) {
		 es.shutdownNow();
	  event.getServletContext().log("listener销毁");
	 }

	 @Override
	 public void contextInitialized(final ServletContextEvent event) {
		 Runnable task = new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					try {
						listenSqoopCMD(event.getServletContext().getRealPath(""));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			};
		 es.submit(task);
	 }
	
	public void listenSqoopCMD(String realPath) throws Exception{
		//服务端在20005端口监听客户端请求的TCP连接
		LOG.debug(realPath);
		int port = Constants.SQOOPCMD_PORT;
		ServerSocket server = new ServerSocket(port);
		Socket client = null;
		boolean f = true;
		while(f){
			//等待客户端的连接，如果没有获取连接
			client = server.accept();
			System.out.println(client.getInetAddress()+"与客户端连接成功！");
			//为每个客户端连接开启一个线程
			new ServerThread(client,realPath).start();
		}
		server.close();
	}
}