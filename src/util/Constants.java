package util;

import java.io.File;

public class Constants {
	/*作业运行日志路径*/
	public final static String LOG_DIR = "/joblog";
	
	/*SqoopCMDServer参数*/
	public final static int SQOOPCMD_PORT = 20005;
	
	/*作业运行状态*/
	public final static int RUNNING = 0;
	public final static int SUCCESS = 1;
	public final static int FAILED = 2;
	
	/*作业类型*/
	public final static int SYSTEM_JOB = 0;
	public final static int IMPORT = 1;
	public final static int IMPORT_MULTI = 2;
	public final static int EXPORT = 3;
	public final static int HDFS_TRANSFER = 4;
	
	/*其他*/
	public final static String SPLIT_SYMBOL = "|||";
	public final static String SPLIT_SYMBOL_REGEX = "\\|\\|\\|";
	}
