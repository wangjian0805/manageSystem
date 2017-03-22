package com.tasly.deepureflow.domain.deepureflow;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.tasly.deepureflow.domain.system.Channel;
import com.tasly.deepureflow.domain.system.Hierarchy;
import com.tasly.deepureflow.domain.system.Office;
import com.tasly.deepureflow.domain.system.Station;
import com.tasly.deepureflow.domain.system.Zone;
import com.tasly.deepureflow.domain.user.Agent;
import com.tasly.deepureflow.domain.user.Terminal;
@XmlRootElement(name = "TerminalFlow")
public class TerminalFlow {
    private String terminalFlowId;

    private String agentId;

    private Date terminalFlowDate;

    private String terminalId;

    private String stationId;

    private String officeId;

    private String zoneId;

    private String hierarchyId;

    private String channelId;

    private String createBy;

    private Date createAt;

    private Integer terminalFlowStatus;
    
  //所属终端
    private Terminal terminal;

    //所属经销商
    private Agent agent;

    //所属岗位
    private Station station;

    //所属
    private Office office;

    //所属区域
    private Zone zone;
    
    private Hierarchy hierarchy;
    
    private Channel channel;
    
    private List<TerminalFlowItem> terminalFlowItemList;
    
    public Terminal getTerminal() {
		return terminal;
	}

	public void setTerminal(Terminal terminal) {
		this.terminal = terminal;
	}

	public Agent getAgent() {
		return agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public Station getStation() {
		return station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public Zone getZone() {
		return zone;
	}

	public void setZone(Zone zone) {
		this.zone = zone;
	}

	public Hierarchy getHierarchy() {
		return hierarchy;
	}

	public void setHierarchy(Hierarchy hierarchy) {
		this.hierarchy = hierarchy;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public List<TerminalFlowItem> getTerminalFlowItemList() {
		return terminalFlowItemList;
	}

	public void setTerminalFlowItemList(List<TerminalFlowItem> terminalFlowItemList) {
		this.terminalFlowItemList = terminalFlowItemList;
	}

	public String getTerminalFlowId() {
        return terminalFlowId;
    }

    public void setTerminalFlowId(String terminalFlowId) {
        this.terminalFlowId = terminalFlowId == null ? null : terminalFlowId.trim();
    }

    public String getAgentId() {
        return agentId;
    }

    public void setAgentId(String agentId) {
        this.agentId = agentId == null ? null : agentId.trim();
    }

    public Date getTerminalFlowDate() {
        return terminalFlowDate;
    }

    public void setTerminalFlowDate(Date terminalFlowDate) {
        this.terminalFlowDate = terminalFlowDate;
    }

    public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId == null ? null : terminalId.trim();
    }

    public String getStationId() {
        return stationId;
    }

    public void setStationId(String stationId) {
        this.stationId = stationId == null ? null : stationId.trim();
    }

    public String getOfficeId() {
        return officeId;
    }

    public void setOfficeId(String officeId) {
        this.officeId = officeId == null ? null : officeId.trim();
    }

    public String getZoneId() {
        return zoneId;
    }

    public void setZoneId(String zoneId) {
        this.zoneId = zoneId == null ? null : zoneId.trim();
    }

    public String getHierarchyId() {
        return hierarchyId;
    }

    public void setHierarchyId(String hierarchyId) {
        this.hierarchyId = hierarchyId == null ? null : hierarchyId.trim();
    }

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId == null ? null : channelId.trim();
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

    public Integer getTerminalFlowStatus() {
        return terminalFlowStatus;
    }

    public void setTerminalFlowStatus(Integer terminalFlowStatus) {
        this.terminalFlowStatus = terminalFlowStatus;
    }
}