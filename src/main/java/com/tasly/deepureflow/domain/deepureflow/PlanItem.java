package com.tasly.deepureflow.domain.deepureflow;

import java.math.BigDecimal;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name = "PlanItem")
public class PlanItem {
    private String salePlanItemId;

    private String salePlanId;

    private String skuId;

    private String skuName;

    private Integer baseQuantity;

    private String baseUnitCode;

    private String baseUnit;

    private BigDecimal basePrice;

    private Integer count;

    private String minUnitCode;

    private String minUnit;

    private BigDecimal totalPrice;

    public String getSalePlanItemId() {
        return salePlanItemId;
    }

    public void setSalePlanItemId(String salePlanItemId) {
        this.salePlanItemId = salePlanItemId == null ? null : salePlanItemId.trim();
    }

    public String getSalePlanId() {
        return salePlanId;
    }

    public void setSalePlanId(String salePlanId) {
        this.salePlanId = salePlanId == null ? null : salePlanId.trim();
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

    public Integer getBaseQuantity() {
        return baseQuantity;
    }

    public void setBaseQuantity(Integer baseQuantity) {
        this.baseQuantity = baseQuantity;
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

    public BigDecimal getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(BigDecimal basePrice) {
        this.basePrice = basePrice;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
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

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
}