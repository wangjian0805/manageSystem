package com.tasly.deepureflow.domain.product;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
    private Integer id;

    private String code;

    private String name;

    private Integer productType;

    private Integer activateFlag;

    private String erpUnitCode;

    private String erpUnit;

    private String erpMinUnitCode;

    private String erpMinUnit;

    private Date createAt;

    private String createBy;

    private String categoryCode;

    private Integer unitQuantity;

    private BigDecimal unitPrice;
    
    private ProductCategory productCategory;

    public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getProductType() {
        return productType;
    }

    public void setProductType(Integer productType) {
        this.productType = productType;
    }

    public Integer getActivateFlag() {
        return activateFlag;
    }

    public void setActivateFlag(Integer activateFlag) {
        this.activateFlag = activateFlag;
    }

    public String getErpUnitCode() {
        return erpUnitCode;
    }

    public void setErpUnitCode(String erpUnitCode) {
        this.erpUnitCode = erpUnitCode == null ? null : erpUnitCode.trim();
    }

    public String getErpUnit() {
        return erpUnit;
    }

    public void setErpUnit(String erpUnit) {
        this.erpUnit = erpUnit == null ? null : erpUnit.trim();
    }

    public String getErpMinUnitCode() {
        return erpMinUnitCode;
    }

    public void setErpMinUnitCode(String erpMinUnitCode) {
        this.erpMinUnitCode = erpMinUnitCode == null ? null : erpMinUnitCode.trim();
    }

    public String getErpMinUnit() {
        return erpMinUnit;
    }

    public void setErpMinUnit(String erpMinUnit) {
        this.erpMinUnit = erpMinUnit == null ? null : erpMinUnit.trim();
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode == null ? null : categoryCode.trim();
    }

    public Integer getUnitQuantity() {
        return unitQuantity;
    }

    public void setUnitQuantity(Integer unitQuantity) {
        this.unitQuantity = unitQuantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }
}