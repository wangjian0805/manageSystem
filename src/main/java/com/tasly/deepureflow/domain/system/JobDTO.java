package com.tasly.deepureflow.domain.system;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "JobDTO")
public class JobDTO {
	private String jobName;
	private String jobGroup;
	private String triggerKey;
	private String cronExpression;
	private String nextFireTime;
	private String state;
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getJobGroup() {
		return jobGroup;
	}
	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}
	public String getCronExpression() {
		return cronExpression;
	}
	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getNextFireTime() {
		return nextFireTime;
	}
	public void setNextFireTime(String nextFireTime) {
		this.nextFireTime = nextFireTime;
	}
	public String getTriggerKey() {
		return triggerKey;
	}
	public void setTriggerKey(String triggerKey) {
		this.triggerKey = triggerKey;
	}
	
}
