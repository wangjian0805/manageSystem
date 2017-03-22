package com.tasly.deepureflow.domain.user;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.tasly.deepureflow.domain.product.ProductCategory;
import com.tasly.deepureflow.domain.system.Channel;
import com.tasly.deepureflow.domain.system.Hierarchy;
import com.tasly.deepureflow.domain.system.Office;
import com.tasly.deepureflow.domain.system.Place;
import com.tasly.deepureflow.domain.system.Station;
import com.tasly.deepureflow.domain.system.Zone;
@XmlRootElement(name = "Terminal")
public class Terminal {
    private String terminalId;

    private String terminalName;

    private Integer terminalType;

    private String erpCode;

    private String agentId;

    private String stationCode;

    private String officeCode;

    private String zoneCode;

    private String channelId;

    private String hierarchyId;

    private Integer terminalStatus;

    private Date planDate;

    private Date joinDate;

    private Date createDate;

    private String terminalAddress;

    private Integer terminalDistrict;

    private Integer terminalCity;

    private Integer terminalProvince;

    private String productCategoryIds;

    private Integer isDelete;

    //所属岗位
    private Station station;
    
    //所属办事处
    private Office office;
    
    //所属大区
    private Zone zone;
    
    //所属经销商
    private Agent agent;
    
    //所属渠道
    private Channel channel;
    
    private User user;
    
    private Place province;
    
    private Place district;
    
    private Place city;
    
    private Hierarchy hierarchy;
    
    private List<ProductCategory> productCategoryList;
    
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

	public Agent getAgent() {
		return agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Place getProvince() {
		return province;
	}

	public void setProvince(Place province) {
		this.province = province;
	}

	public Place getDistrict() {
		return district;
	}

	public void setDistrict(Place district) {
		this.district = district;
	}

	public Place getCity() {
		return city;
	}

	public void setCity(Place city) {
		this.city = city;
	}

	public Hierarchy getHierarchy() {
		return hierarchy;
	}

	public void setHierarchy(Hierarchy hierarchy) {
		this.hierarchy = hierarchy;
	}

	public List<ProductCategory> getProductCategoryList() {
		return productCategoryList;
	}

	public void setProductCategoryList(List<ProductCategory> productCategoryList) {
		this.productCategoryList = productCategoryList;
	}

	public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId == null ? null : terminalId.trim();
    }

    public String getTerminalName() {
        return terminalName;
    }

    public void setTerminalName(String terminalName) {
        this.terminalName = terminalName == null ? null : terminalName.trim();
    }

    public Integer getTerminalType() {
        return terminalType;
    }

    public void setTerminalType(Integer terminalType) {
        this.terminalType = terminalType;
    }

    public String getErpCode() {
        return erpCode;
    }

    public void setErpCode(String erpCode) {
        this.erpCode = erpCode == null ? null : erpCode.trim();
    }

    public String getAgentId() {
        return agentId;
    }

    public void setAgentId(String agentId) {
        this.agentId = agentId == null ? null : agentId.trim();
    }

    public String getStationCode() {
        return stationCode;
    }

    public void setStationCode(String stationCode) {
        this.stationCode = stationCode == null ? null : stationCode.trim();
    }

    public String getOfficeCode() {
        return officeCode;
    }

    public void setOfficeCode(String officeCode) {
        this.officeCode = officeCode == null ? null : officeCode.trim();
    }

    public String getZoneCode() {
        return zoneCode;
    }

    public void setZoneCode(String zoneCode) {
        this.zoneCode = zoneCode == null ? null : zoneCode.trim();
    }

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId == null ? null : channelId.trim();
    }

    public String getHierarchyId() {
        return hierarchyId;
    }

    public void setHierarchyId(String hierarchyId) {
        this.hierarchyId = hierarchyId == null ? null : hierarchyId.trim();
    }

    public Integer getTerminalStatus() {
        return terminalStatus;
    }

    public void setTerminalStatus(Integer terminalStatus) {
        this.terminalStatus = terminalStatus;
    }

    public Date getPlanDate() {
        return planDate;
    }

    public void setPlanDate(Date planDate) {
        this.planDate = planDate;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getTerminalAddress() {
        return terminalAddress;
    }

    public void setTerminalAddress(String terminalAddress) {
        this.terminalAddress = terminalAddress == null ? null : terminalAddress.trim();
    }

    public Integer getTerminalDistrict() {
        return terminalDistrict;
    }

    public void setTerminalDistrict(Integer terminalDistrict) {
        this.terminalDistrict = terminalDistrict;
    }

    public Integer getTerminalCity() {
        return terminalCity;
    }

    public void setTerminalCity(Integer terminalCity) {
        this.terminalCity = terminalCity;
    }

    public Integer getTerminalProvince() {
        return terminalProvince;
    }

    public void setTerminalProvince(Integer terminalProvince) {
        this.terminalProvince = terminalProvince;
    }

    public String getProductCategoryIds() {
        return productCategoryIds;
    }

    public void setProductCategoryIds(String productCategoryIds) {
        this.productCategoryIds = productCategoryIds == null ? null : productCategoryIds.trim();
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}