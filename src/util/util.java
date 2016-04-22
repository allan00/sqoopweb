package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class util {
	public static String returnDate() {
		int year = new java.util.Date().getYear();
		String year2 = (year + 1900) + "";
		String month = (new java.util.Date().getMonth() + 1) + "";
		String date = new java.util.Date().getDate() + "";
		String hour = new java.util.Date().getHours() + "";

		String minute = new java.util.Date().getMinutes() + "";
		String seconds = new java.util.Date().getSeconds() + "";
		if (month.length() < 2) {
			month = "0" + month;
		}
		if (hour.length() < 2) {
			hour = "0" + hour;
		}
		return year2 + month + date + hour + minute + seconds;
	}

	public static boolean isOcuppied(File file) {
		if (file.renameTo(file)) {
			return false;
		} else {
			return true;
		}
	}
	
	public static String getMetaURL(){
		String url = "'jdbc:mysql://master:3306/sqoop_schema?user=root&password=root'";
		return url;
	}
	
	public static String getLogPath(){
		String path = Object.class.getClassLoader().getResource("").getPath()+"/"+Constants.LOG_DIR;
		return path;
	}

	//当作业成功时返回1，作业失败时返回2
	//logFile中若含有completed successfully，则作业执行成功
	public static int parseIsSuccess(File logFile){
		FileReader in = null;
		BufferedReader br = null;
		try {
			in = new FileReader(logFile);
			br = new BufferedReader(in);
			String line;
			while((line=br.readLine())!=null){
				if(line.contains("completed successfully"))
					return 1;
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				in.close();
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return 2;
	}
}
