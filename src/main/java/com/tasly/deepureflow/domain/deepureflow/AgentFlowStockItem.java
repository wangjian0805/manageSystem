package com.tasly.deepureflow.domain.deepureflow;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "AgentFlowStockItem")
public class AgentFlowStockItem {
    private String agentFlowShipmentItemId;

    private String agentFlowId;

    private String skuId;

    private String skuName;

    private Integer stockQuantity;

    private Integer stockMinQuantity;

    private String baseUnitCode;

    private String baseUnit;

    private String minUnitCode;

    private String minUnit;

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

    public Integer getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(Integer stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public Integer getStockMinQuantity() {
        return stockMinQuantity;
    }

    public void setStockMinQuantity(Integer stockMinQuantity) {
        this.stockMinQuantity = stockMinQuantity;
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
}