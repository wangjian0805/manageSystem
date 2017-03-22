package com.tasly.deepureflow.domain.deepureflow;

import java.math.BigDecimal;
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
@XmlRootElement(name = "SalePlan")
public class SalePlan {
    private String salePlanId;

    private Date salePlanDate;

    private BigDecimal totalPrice;

    private String terminalId;

    private String stationId;

    private String officeId;

    private String zoneId;

    private String agentId;

    private String hierarchyId;

    private String channelId;

    private String createBy;

    private Date createAt;

    private Integer salePlanStatus;
    
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
    
    private List<PlanItem> planItemList;
    
    

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

	public List<PlanItem> getPlanItemList() {
		return planItemList;
	}

	public void setPlanItemList(List<PlanItem> planItemList) {
		this.planItemList = planItemList;
	}

	public String getSalePlanId() {
        return salePlanId;
    }

    public void setSalePlanId(String salePlanId) {
        this.salePlanId = salePlanId == null ? null : salePlanId.trim();
    }

    public Date getSalePlanDate() {
        return salePlanDate;
    }

    public void setSalePlanDate(Date salePlanDate) {
        this.salePlanDate = salePlanDate;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
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

    public String getAgentId() {
        return agentId;
    }

    public void setAgentId(String agentId) {
        this.agentId = agentId == null ? null : agentId.trim();
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

    public Integer getSalePlanStatus() {
        return salePlanStatus;
    }

    public void setSalePlanStatus(Integer salePlanStatus) {
        this.salePlanStatus = salePlanStatus;
    }
}