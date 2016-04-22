package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.Socket;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.metastatic.rsync.ChecksumPair;
import org.metastatic.rsync.Rdiff;

/**
 * 该类为多线程类，用于服务端
 */
public class ServerThread extends Thread {
	public static final Log LOG = LogFactory.getLog(ServerThread.class.getName());
	private Socket client = null;

	private final int MAPS = 4;
	File workDirectory = null;
	File basis = null;
	File sigFile = null;
	File[] delta = new File[MAPS];
	File deltaTotalFile = null;

	public ServerThread(Socket client) {
		this.client = client;
	}

	@Override
	public void run() {
		try {
			
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
}