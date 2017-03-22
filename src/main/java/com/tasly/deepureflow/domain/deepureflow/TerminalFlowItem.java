package com.tasly.deepureflow.domain.deepureflow;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "TerminalFlowItem")
public class TerminalFlowItem {
    private String terminalFlowItemId;

    private String terminalFlowId;

    private String skuId;

    private String skuName;

    private Integer stockQuantity;

    private String baseUnitCode;

    private String baseUnit;

    private String minUnitCode;

    private String minUnit;

    private Integer stockMinQuantity;

    public String getTerminalFlowItemId() {
        return terminalFlowItemId;
    }

    public void setTerminalFlowItemId(String terminalFlowItemId) {
        this.terminalFlowItemId = terminalFlowItemId == null ? null : terminalFlowItemId.trim();
    }

    public String getTerminalFlowId() {
        return terminalFlowId;
    }

    public void setTerminalFlowId(String terminalFlowId) {
        this.terminalFlowId = terminalFlowId == null ? null : terminalFlowId.trim();
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

    public Integer getStockMinQuantity() {
        return stockMinQuantity;
    }

    public void setStockMinQuantity(Integer stockMinQuantity) {
        this.stockMinQuantity = stockMinQuantity;
    }
}