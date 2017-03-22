package com.tasly.deepureflow.domain.deepureflow;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.tasly.deepureflow.domain.user.Agent;
@XmlRootElement(name = "AgentFlow")
public class AgentFlow {
    private String agentFlowId;

    private Date agentFlowDate;

    private String agentId;

    private String createBy;

    private Date createAt;

    private Integer agentFlowStatus;
    
    private Agent agent;
    
    private List<AgentFlowStockItem> agentFlowStockItemList;
    
    private List<AgentFlowShipmentItem> agentFlowShipmentItemList;
    
    
    
    public List<AgentFlowStockItem> getAgentFlowStockItemList() {
		return agentFlowStockItemList;
	}

	public void setAgentFlowStockItemList(List<AgentFlowStockItem> agentFlowStockItemList) {
		this.agentFlowStockItemList = agentFlowStockItemList;
	}

	public List<AgentFlowShipmentItem> getAgentFlowShipmentItemList() {
		return agentFlowShipmentItemList;
	}

	public void setAgentFlowShipmentItemList(List<AgentFlowShipmentItem> agentFlowShipmentItemList) {
		this.agentFlowShipmentItemList = agentFlowShipmentItemList;
	}

	public Agent getAgent() {
		return agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public String getAgentFlowId() {
        return agentFlowId;
    }

    public void setAgentFlowId(String agentFlowId) {
        this.agentFlowId = agentFlowId == null ? null : agentFlowId.trim();
    }

    public Date getAgentFlowDate() {
        return agentFlowDate;
    }

    public void setAgentFlowDate(Date agentFlowDate) {
        this.agentFlowDate = agentFlowDate;
    }

    public String getAgentId() {
        return agentId;
    }

    public void setAgentId(String agentId) {
        this.agentId = agentId == null ? null : agentId.trim();
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Integer getAgentFlowStatus() {
        return agentFlowStatus;
    }

    public void setAgentFlowStatus(Integer agentFlowStatus) {
        this.agentFlowStatus = agentFlowStatus;
    }
}