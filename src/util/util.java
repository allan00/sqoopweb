package util;

import java.io.File;

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
}
