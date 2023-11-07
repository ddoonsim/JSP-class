package com.momo.dto;

public class JobDto {
	
	// 필드
	private String jobCode ;
	private String jobName ;
	
	// 생성자
	
	// Setter & Getter 메서드
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	@Override
	public String toString() {
		return jobCode + " : " + jobName + "\n";
	}

}
