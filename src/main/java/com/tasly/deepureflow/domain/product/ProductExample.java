package com.tasly.deepureflow.domain.product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("ID is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("ID is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("ID =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("ID <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("ID >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ID >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("ID <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("ID <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("ID in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("ID not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("ID between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ID not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCodeIsNull() {
            addCriterion("CODE is null");
            return (Criteria) this;
        }

        public Criteria andCodeIsNotNull() {
            addCriterion("CODE is not null");
            return (Criteria) this;
        }

        public Criteria andCodeEqualTo(String value) {
            addCriterion("CODE =", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotEqualTo(String value) {
            addCriterion("CODE <>", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeGreaterThan(String value) {
            addCriterion("CODE >", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeGreaterThanOrEqualTo(String value) {
            addCriterion("CODE >=", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLessThan(String value) {
            addCriterion("CODE <", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLessThanOrEqualTo(String value) {
            addCriterion("CODE <=", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLike(String value) {
            addCriterion("CODE like", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotLike(String value) {
            addCriterion("CODE not like", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeIn(List<String> values) {
            addCriterion("CODE in", values, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotIn(List<String> values) {
            addCriterion("CODE not in", values, "code");
            return (Criteria) this;
        }

        public Criteria andCodeBetween(String value1, String value2) {
            addCriterion("CODE between", value1, value2, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotBetween(String value1, String value2) {
            addCriterion("CODE not between", value1, value2, "code");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("NAME is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("NAME is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("NAME =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("NAME <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("NAME >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("NAME >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("NAME <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("NAME <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("NAME like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("NAME not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("NAME in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("NAME not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("NAME between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("NAME not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andProductTypeIsNull() {
            addCriterion("PRODUCT_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andProductTypeIsNotNull() {
            addCriterion("PRODUCT_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andProductTypeEqualTo(Byte value) {
            addCriterion("PRODUCT_TYPE =", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeNotEqualTo(Byte value) {
            addCriterion("PRODUCT_TYPE <>", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeGreaterThan(Byte value) {
            addCriterion("PRODUCT_TYPE >", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeGreaterThanOrEqualTo(Byte value) {
            addCriterion("PRODUCT_TYPE >=", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeLessThan(Byte value) {
            addCriterion("PRODUCT_TYPE <", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeLessThanOrEqualTo(Byte value) {
            addCriterion("PRODUCT_TYPE <=", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeIn(List<Byte> values) {
            addCriterion("PRODUCT_TYPE in", values, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeNotIn(List<Byte> values) {
            addCriterion("PRODUCT_TYPE not in", values, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeBetween(Byte value1, Byte value2) {
            addCriterion("PRODUCT_TYPE between", value1, value2, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeNotBetween(Byte value1, Byte value2) {
            addCriterion("PRODUCT_TYPE not between", value1, value2, "productType");
            return (Criteria) this;
        }

        public Criteria andActivateFlagIsNull() {
            addCriterion("ACTIVATE_FLAG is null");
            return (Criteria) this;
        }

        public Criteria andActivateFlagIsNotNull() {
            addCriterion("ACTIVATE_FLAG is not null");
            return (Criteria) this;
        }

        public Criteria andActivateFlagEqualTo(Byte value) {
            addCriterion("ACTIVATE_FLAG =", value, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagNotEqualTo(Byte value) {
            addCriterion("ACTIVATE_FLAG <>", value, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagGreaterThan(Byte value) {
            addCriterion("ACTIVATE_FLAG >", value, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagGreaterThanOrEqualTo(Byte value) {
            addCriterion("ACTIVATE_FLAG >=", value, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagLessThan(Byte value) {
            addCriterion("ACTIVATE_FLAG <", value, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagLessThanOrEqualTo(Byte value) {
            addCriterion("ACTIVATE_FLAG <=", value, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagIn(List<Byte> values) {
            addCriterion("ACTIVATE_FLAG in", values, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagNotIn(List<Byte> values) {
            addCriterion("ACTIVATE_FLAG not in", values, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagBetween(Byte value1, Byte value2) {
            addCriterion("ACTIVATE_FLAG between", value1, value2, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andActivateFlagNotBetween(Byte value1, Byte value2) {
            addCriterion("ACTIVATE_FLAG not between", value1, value2, "activateFlag");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeIsNull() {
            addCriterion("ERP_UNIT_CODE is null");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeIsNotNull() {
            addCriterion("ERP_UNIT_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeEqualTo(String value) {
            addCriterion("ERP_UNIT_CODE =", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeNotEqualTo(String value) {
            addCriterion("ERP_UNIT_CODE <>", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeGreaterThan(String value) {
            addCriterion("ERP_UNIT_CODE >", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeGreaterThanOrEqualTo(String value) {
            addCriterion("ERP_UNIT_CODE >=", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeLessThan(String value) {
            addCriterion("ERP_UNIT_CODE <", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeLessThanOrEqualTo(String value) {
            addCriterion("ERP_UNIT_CODE <=", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeLike(String value) {
            addCriterion("ERP_UNIT_CODE like", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeNotLike(String value) {
            addCriterion("ERP_UNIT_CODE not like", value, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeIn(List<String> values) {
            addCriterion("ERP_UNIT_CODE in", values, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeNotIn(List<String> values) {
            addCriterion("ERP_UNIT_CODE not in", values, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeBetween(String value1, String value2) {
            addCriterion("ERP_UNIT_CODE between", value1, value2, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitCodeNotBetween(String value1, String value2) {
            addCriterion("ERP_UNIT_CODE not between", value1, value2, "erpUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpUnitIsNull() {
            addCriterion("ERP_UNIT is null");
            return (Criteria) this;
        }

        public Criteria andErpUnitIsNotNull() {
            addCriterion("ERP_UNIT is not null");
            return (Criteria) this;
        }

        public Criteria andErpUnitEqualTo(String value) {
            addCriterion("ERP_UNIT =", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitNotEqualTo(String value) {
            addCriterion("ERP_UNIT <>", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitGreaterThan(String value) {
            addCriterion("ERP_UNIT >", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitGreaterThanOrEqualTo(String value) {
            addCriterion("ERP_UNIT >=", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitLessThan(String value) {
            addCriterion("ERP_UNIT <", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitLessThanOrEqualTo(String value) {
            addCriterion("ERP_UNIT <=", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitLike(String value) {
            addCriterion("ERP_UNIT like", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitNotLike(String value) {
            addCriterion("ERP_UNIT not like", value, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitIn(List<String> values) {
            addCriterion("ERP_UNIT in", values, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitNotIn(List<String> values) {
            addCriterion("ERP_UNIT not in", values, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitBetween(String value1, String value2) {
            addCriterion("ERP_UNIT between", value1, value2, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpUnitNotBetween(String value1, String value2) {
            addCriterion("ERP_UNIT not between", value1, value2, "erpUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeIsNull() {
            addCriterion("ERP_MIN_UNIT_CODE is null");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeIsNotNull() {
            addCriterion("ERP_MIN_UNIT_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT_CODE =", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeNotEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT_CODE <>", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeGreaterThan(String value) {
            addCriterion("ERP_MIN_UNIT_CODE >", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeGreaterThanOrEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT_CODE >=", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeLessThan(String value) {
            addCriterion("ERP_MIN_UNIT_CODE <", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeLessThanOrEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT_CODE <=", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeLike(String value) {
            addCriterion("ERP_MIN_UNIT_CODE like", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeNotLike(String value) {
            addCriterion("ERP_MIN_UNIT_CODE not like", value, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeIn(List<String> values) {
            addCriterion("ERP_MIN_UNIT_CODE in", values, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeNotIn(List<String> values) {
            addCriterion("ERP_MIN_UNIT_CODE not in", values, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeBetween(String value1, String value2) {
            addCriterion("ERP_MIN_UNIT_CODE between", value1, value2, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitCodeNotBetween(String value1, String value2) {
            addCriterion("ERP_MIN_UNIT_CODE not between", value1, value2, "erpMinUnitCode");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitIsNull() {
            addCriterion("ERP_MIN_UNIT is null");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitIsNotNull() {
            addCriterion("ERP_MIN_UNIT is not null");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT =", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitNotEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT <>", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitGreaterThan(String value) {
            addCriterion("ERP_MIN_UNIT >", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitGreaterThanOrEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT >=", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitLessThan(String value) {
            addCriterion("ERP_MIN_UNIT <", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitLessThanOrEqualTo(String value) {
            addCriterion("ERP_MIN_UNIT <=", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitLike(String value) {
            addCriterion("ERP_MIN_UNIT like", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitNotLike(String value) {
            addCriterion("ERP_MIN_UNIT not like", value, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitIn(List<String> values) {
            addCriterion("ERP_MIN_UNIT in", values, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitNotIn(List<String> values) {
            addCriterion("ERP_MIN_UNIT not in", values, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitBetween(String value1, String value2) {
            addCriterion("ERP_MIN_UNIT between", value1, value2, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andErpMinUnitNotBetween(String value1, String value2) {
            addCriterion("ERP_MIN_UNIT not between", value1, value2, "erpMinUnit");
            return (Criteria) this;
        }

        public Criteria andCreateAtIsNull() {
            addCriterion("CREATE_AT is null");
            return (Criteria) this;
        }

        public Criteria andCreateAtIsNotNull() {
            addCriterion("CREATE_AT is not null");
            return (Criteria) this;
        }

        public Criteria andCreateAtEqualTo(Date value) {
            addCriterion("CREATE_AT =", value, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtNotEqualTo(Date value) {
            addCriterion("CREATE_AT <>", value, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtGreaterThan(Date value) {
            addCriterion("CREATE_AT >", value, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATE_AT >=", value, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtLessThan(Date value) {
            addCriterion("CREATE_AT <", value, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtLessThanOrEqualTo(Date value) {
            addCriterion("CREATE_AT <=", value, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtIn(List<Date> values) {
            addCriterion("CREATE_AT in", values, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtNotIn(List<Date> values) {
            addCriterion("CREATE_AT not in", values, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtBetween(Date value1, Date value2) {
            addCriterion("CREATE_AT between", value1, value2, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateAtNotBetween(Date value1, Date value2) {
            addCriterion("CREATE_AT not between", value1, value2, "createAt");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNull() {
            addCriterion("CREATE_BY is null");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNotNull() {
            addCriterion("CREATE_BY is not null");
            return (Criteria) this;
        }

        public Criteria andCreateByEqualTo(String value) {
            addCriterion("CREATE_BY =", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotEqualTo(String value) {
            addCriterion("CREATE_BY <>", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThan(String value) {
            addCriterion("CREATE_BY >", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThanOrEqualTo(String value) {
            addCriterion("CREATE_BY >=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThan(String value) {
            addCriterion("CREATE_BY <", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThanOrEqualTo(String value) {
            addCriterion("CREATE_BY <=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLike(String value) {
            addCriterion("CREATE_BY like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotLike(String value) {
            addCriterion("CREATE_BY not like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByIn(List<String> values) {
            addCriterion("CREATE_BY in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotIn(List<String> values) {
            addCriterion("CREATE_BY not in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByBetween(String value1, String value2) {
            addCriterion("CREATE_BY between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotBetween(String value1, String value2) {
            addCriterion("CREATE_BY not between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeIsNull() {
            addCriterion("CATEGORY_CODE is null");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeIsNotNull() {
            addCriterion("CATEGORY_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeEqualTo(String value) {
            addCriterion("CATEGORY_CODE =", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeNotEqualTo(String value) {
            addCriterion("CATEGORY_CODE <>", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeGreaterThan(String value) {
            addCriterion("CATEGORY_CODE >", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeGreaterThanOrEqualTo(String value) {
            addCriterion("CATEGORY_CODE >=", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeLessThan(String value) {
            addCriterion("CATEGORY_CODE <", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeLessThanOrEqualTo(String value) {
            addCriterion("CATEGORY_CODE <=", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeLike(String value) {
            addCriterion("CATEGORY_CODE like", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeNotLike(String value) {
            addCriterion("CATEGORY_CODE not like", value, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeIn(List<String> values) {
            addCriterion("CATEGORY_CODE in", values, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeNotIn(List<String> values) {
            addCriterion("CATEGORY_CODE not in", values, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeBetween(String value1, String value2) {
            addCriterion("CATEGORY_CODE between", value1, value2, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andCategoryCodeNotBetween(String value1, String value2) {
            addCriterion("CATEGORY_CODE not between", value1, value2, "categoryCode");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityIsNull() {
            addCriterion("UNIT_QUANTITY is null");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityIsNotNull() {
            addCriterion("UNIT_QUANTITY is not null");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityEqualTo(Integer value) {
            addCriterion("UNIT_QUANTITY =", value, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityNotEqualTo(Integer value) {
            addCriterion("UNIT_QUANTITY <>", value, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityGreaterThan(Integer value) {
            addCriterion("UNIT_QUANTITY >", value, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("UNIT_QUANTITY >=", value, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityLessThan(Integer value) {
            addCriterion("UNIT_QUANTITY <", value, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("UNIT_QUANTITY <=", value, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityIn(List<Integer> values) {
            addCriterion("UNIT_QUANTITY in", values, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityNotIn(List<Integer> values) {
            addCriterion("UNIT_QUANTITY not in", values, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityBetween(Integer value1, Integer value2) {
            addCriterion("UNIT_QUANTITY between", value1, value2, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("UNIT_QUANTITY not between", value1, value2, "unitQuantity");
            return (Criteria) this;
        }

        public Criteria andUnitPriceIsNull() {
            addCriterion("UNIT_PRICE is null");
            return (Criteria) this;
        }

        public Criteria andUnitPriceIsNotNull() {
            addCriterion("UNIT_PRICE is not null");
            return (Criteria) this;
        }

        public Criteria andUnitPriceEqualTo(BigDecimal value) {
            addCriterion("UNIT_PRICE =", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceNotEqualTo(BigDecimal value) {
            addCriterion("UNIT_PRICE <>", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceGreaterThan(BigDecimal value) {
            addCriterion("UNIT_PRICE >", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("UNIT_PRICE >=", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceLessThan(BigDecimal value) {
            addCriterion("UNIT_PRICE <", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("UNIT_PRICE <=", value, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceIn(List<BigDecimal> values) {
            addCriterion("UNIT_PRICE in", values, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceNotIn(List<BigDecimal> values) {
            addCriterion("UNIT_PRICE not in", values, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("UNIT_PRICE between", value1, value2, "unitPrice");
            return (Criteria) this;
        }

        public Criteria andUnitPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("UNIT_PRICE not between", value1, value2, "unitPrice");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}