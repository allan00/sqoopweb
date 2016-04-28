package model;

import java.sql.Timestamp;

public class Job {
	private int id;
	private String jobName;
	private Timestamp startTime;
	private Timestamp endTime;
	private String mrID;
	private String logFileName;
	private int state;
	private int type;//作业类型，1表示单源导入，2表示多源导入，3表示导出，4表示hdfs迁移
	private String logContent;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getMrID() {
		return mrID;
	}
	public void setMrID(String mrID) {
		this.mrID = mrID;
	}
	public String getLogFileName() {
		return logFileName;
	}
	public void setLogFileName(String logFileName) {
		this.logFileName = logFileName;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getLogContent() {
		return logContent;
	}
	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}
}
