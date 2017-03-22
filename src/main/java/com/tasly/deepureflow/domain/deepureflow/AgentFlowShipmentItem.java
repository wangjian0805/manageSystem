package com.tasly.deepureflow.domain.deepureflow;

import javax.xml.bind.annotation.XmlRootElement;

import com.tasly.deepureflow.domain.system.Channel;
import com.tasly.deepureflow.domain.system.Hierarchy;
import com.tasly.deepureflow.domain.system.Office;
import com.tasly.deepureflow.domain.system.Station;
import com.tasly.deepureflow.domain.system.Zone;
import com.tasly.deepureflow.domain.user.Terminal;

@XmlRootElement(name = "AgentFlowShipmentItem")
public class AgentFlowShipmentItem {
    private String agentFlowShipmentItemId;

    private String agentFlowId;

    private String skuId;

    private String skuName;

    private Integer shipmentQuantity;

    private Integer shipmentMinQuantity;

    private String baseUnitCode;

    private String baseUnit;

    private String minUnitCode;

    private String minUnit;

    private String terminalId;

    private String hierarchyId;

    private String channelId;

    private String stationId;

    private String officeId;

    private String zoneId;
    
    private Channel channel;
    
    private Hierarchy hierarchy;
    
    private Terminal terminal;
    
    private Station station;
    
    private Office office;
    
    private Zone zone;

    public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public Hierarchy getHierarchy() {
		return hierarchy;
	}

	public void setHierarchy(Hierarchy hierarchy) {
		this.hierarchy = hierarchy;
	}

	public Terminal getTerminal() {
		return terminal;
	}

	public void setTerminal(Terminal terminal) {
		this.terminal = terminal;
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

	public String getAgentFlowShipmentItemId() {
        return agentFlowShipmentItemId;
    }

    public void setAgentFlowShipmentItemId(String agentFlowShipmentItemId) {
        this.agentFlowShipmentItemId = agentFlowShipmentItemId == null ? null : agentFlowShipmentItemId.trim();
    }

    public String getAgentFlowId() {
        return agentFlowId;
    }

    public void setAgentFlowId(String agentFlowId) {
        this.agentFlowId = agentFlowId == null ? null : agentFlowId.trim();
    }

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId == null ? null : skuId.trim();
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName == null ? null : skuName.trim();
    }

    public Integer getShipmentQuantity() {
        return shipmentQuantity;
    }

    public void setShipmentQuantity(Integer shipmentQuantity) {
        this.shipmentQuantity = shipmentQuantity;
    }

    public Integer getShipmentMinQuantity() {
        return shipmentMinQuantity;
    }

    public void setShipmentMinQuantity(Integer shipmentMinQuantity) {
        this.shipmentMinQuantity = shipmentMinQuantity;
    }

    public String getBaseUnitCode() {
        return baseUnitCode;
    }

    public void setBaseUnitCode(String baseUnitCode) {
        this.baseUnitCode = baseUnitCode == null ? null : baseUnitCode.trim();
    }

    public String getBaseUnit() {
        return baseUnit;
    }

    public void setBaseUnit(String baseUnit) {
        this.baseUnit = baseUnit == null ? null : baseUnit.trim();
    }

    public String getMinUnitCode() {
        return minUnitCode;
    }

    public void setMinUnitCode(String minUnitCode) {
        this.minUnitCode = minUnitCode == null ? null : minUnitCode.trim();
    }

    public String getMinUnit() {
        return minUnit;
    }

    public void setMinUnit(String minUnit) {
        this.minUnit = minUnit == null ? null : minUnit.trim();
    }

    public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId == null ? null : terminalId.trim();
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
}