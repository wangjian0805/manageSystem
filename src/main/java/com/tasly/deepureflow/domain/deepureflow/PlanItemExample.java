package com.tasly.deepureflow.domain.deepureflow;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class PlanItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PlanItemExample() {
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

        public Criteria andSalePlanItemIdIsNull() {
            addCriterion("SALE_PLAN_ITEM_ID is null");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdIsNotNull() {
            addCriterion("SALE_PLAN_ITEM_ID is not null");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdEqualTo(String value) {
            addCriterion("SALE_PLAN_ITEM_ID =", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdNotEqualTo(String value) {
            addCriterion("SALE_PLAN_ITEM_ID <>", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdGreaterThan(String value) {
            addCriterion("SALE_PLAN_ITEM_ID >", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdGreaterThanOrEqualTo(String value) {
            addCriterion("SALE_PLAN_ITEM_ID >=", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdLessThan(String value) {
            addCriterion("SALE_PLAN_ITEM_ID <", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdLessThanOrEqualTo(String value) {
            addCriterion("SALE_PLAN_ITEM_ID <=", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdLike(String value) {
            addCriterion("SALE_PLAN_ITEM_ID like", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdNotLike(String value) {
            addCriterion("SALE_PLAN_ITEM_ID not like", value, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdIn(List<String> values) {
            addCriterion("SALE_PLAN_ITEM_ID in", values, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdNotIn(List<String> values) {
            addCriterion("SALE_PLAN_ITEM_ID not in", values, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdBetween(String value1, String value2) {
            addCriterion("SALE_PLAN_ITEM_ID between", value1, value2, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanItemIdNotBetween(String value1, String value2) {
            addCriterion("SALE_PLAN_ITEM_ID not between", value1, value2, "salePlanItemId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdIsNull() {
            addCriterion("SALE_PLAN_ID is null");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdIsNotNull() {
            addCriterion("SALE_PLAN_ID is not null");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdEqualTo(String value) {
            addCriterion("SALE_PLAN_ID =", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdNotEqualTo(String value) {
            addCriterion("SALE_PLAN_ID <>", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdGreaterThan(String value) {
            addCriterion("SALE_PLAN_ID >", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdGreaterThanOrEqualTo(String value) {
            addCriterion("SALE_PLAN_ID >=", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdLessThan(String value) {
            addCriterion("SALE_PLAN_ID <", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdLessThanOrEqualTo(String value) {
            addCriterion("SALE_PLAN_ID <=", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdLike(String value) {
            addCriterion("SALE_PLAN_ID like", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdNotLike(String value) {
            addCriterion("SALE_PLAN_ID not like", value, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdIn(List<String> values) {
            addCriterion("SALE_PLAN_ID in", values, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdNotIn(List<String> values) {
            addCriterion("SALE_PLAN_ID not in", values, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdBetween(String value1, String value2) {
            addCriterion("SALE_PLAN_ID between", value1, value2, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSalePlanIdNotBetween(String value1, String value2) {
            addCriterion("SALE_PLAN_ID not between", value1, value2, "salePlanId");
            return (Criteria) this;
        }

        public Criteria andSkuIdIsNull() {
            addCriterion("SKU_ID is null");
            return (Criteria) this;
        }

        public Criteria andSkuIdIsNotNull() {
            addCriterion("SKU_ID is not null");
            return (Criteria) this;
        }

        public Criteria andSkuIdEqualTo(String value) {
            addCriterion("SKU_ID =", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdNotEqualTo(String value) {
            addCriterion("SKU_ID <>", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdGreaterThan(String value) {
            addCriterion("SKU_ID >", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdGreaterThanOrEqualTo(String value) {
            addCriterion("SKU_ID >=", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdLessThan(String value) {
            addCriterion("SKU_ID <", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdLessThanOrEqualTo(String value) {
            addCriterion("SKU_ID <=", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdLike(String value) {
            addCriterion("SKU_ID like", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdNotLike(String value) {
            addCriterion("SKU_ID not like", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdIn(List<String> values) {
            addCriterion("SKU_ID in", values, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdNotIn(List<String> values) {
            addCriterion("SKU_ID not in", values, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdBetween(String value1, String value2) {
            addCriterion("SKU_ID between", value1, value2, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdNotBetween(String value1, String value2) {
            addCriterion("SKU_ID not between", value1, value2, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuNameIsNull() {
            addCriterion("SKU_NAME is null");
            return (Criteria) this;
        }

        public Criteria andSkuNameIsNotNull() {
            addCriterion("SKU_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andSkuNameEqualTo(String value) {
            addCriterion("SKU_NAME =", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameNotEqualTo(String value) {
            addCriterion("SKU_NAME <>", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameGreaterThan(String value) {
            addCriterion("SKU_NAME >", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameGreaterThanOrEqualTo(String value) {
            addCriterion("SKU_NAME >=", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameLessThan(String value) {
            addCriterion("SKU_NAME <", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameLessThanOrEqualTo(String value) {
            addCriterion("SKU_NAME <=", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameLike(String value) {
            addCriterion("SKU_NAME like", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameNotLike(String value) {
            addCriterion("SKU_NAME not like", value, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameIn(List<String> values) {
            addCriterion("SKU_NAME in", values, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameNotIn(List<String> values) {
            addCriterion("SKU_NAME not in", values, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameBetween(String value1, String value2) {
            addCriterion("SKU_NAME between", value1, value2, "skuName");
            return (Criteria) this;
        }

        public Criteria andSkuNameNotBetween(String value1, String value2) {
            addCriterion("SKU_NAME not between", value1, value2, "skuName");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityIsNull() {
            addCriterion("BASE_QUANTITY is null");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityIsNotNull() {
            addCriterion("BASE_QUANTITY is not null");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityEqualTo(Integer value) {
            addCriterion("BASE_QUANTITY =", value, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityNotEqualTo(Integer value) {
            addCriterion("BASE_QUANTITY <>", value, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityGreaterThan(Integer value) {
            addCriterion("BASE_QUANTITY >", value, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("BASE_QUANTITY >=", value, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityLessThan(Integer value) {
            addCriterion("BASE_QUANTITY <", value, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("BASE_QUANTITY <=", value, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityIn(List<Integer> values) {
            addCriterion("BASE_QUANTITY in", values, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityNotIn(List<Integer> values) {
            addCriterion("BASE_QUANTITY not in", values, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityBetween(Integer value1, Integer value2) {
            addCriterion("BASE_QUANTITY between", value1, value2, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("BASE_QUANTITY not between", value1, value2, "baseQuantity");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeIsNull() {
            addCriterion("BASE_UNIT_CODE is null");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeIsNotNull() {
            addCriterion("BASE_UNIT_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeEqualTo(String value) {
            addCriterion("BASE_UNIT_CODE =", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeNotEqualTo(String value) {
            addCriterion("BASE_UNIT_CODE <>", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeGreaterThan(String value) {
            addCriterion("BASE_UNIT_CODE >", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeGreaterThanOrEqualTo(String value) {
            addCriterion("BASE_UNIT_CODE >=", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeLessThan(String value) {
            addCriterion("BASE_UNIT_CODE <", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeLessThanOrEqualTo(String value) {
            addCriterion("BASE_UNIT_CODE <=", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeLike(String value) {
            addCriterion("BASE_UNIT_CODE like", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeNotLike(String value) {
            addCriterion("BASE_UNIT_CODE not like", value, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeIn(List<String> values) {
            addCriterion("BASE_UNIT_CODE in", values, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeNotIn(List<String> values) {
            addCriterion("BASE_UNIT_CODE not in", values, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeBetween(String value1, String value2) {
            addCriterion("BASE_UNIT_CODE between", value1, value2, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitCodeNotBetween(String value1, String value2) {
            addCriterion("BASE_UNIT_CODE not between", value1, value2, "baseUnitCode");
            return (Criteria) this;
        }

        public Criteria andBaseUnitIsNull() {
            addCriterion("BASE_UNIT is null");
            return (Criteria) this;
        }

        public Criteria andBaseUnitIsNotNull() {
            addCriterion("BASE_UNIT is not null");
            return (Criteria) this;
        }

        public Criteria andBaseUnitEqualTo(String value) {
            addCriterion("BASE_UNIT =", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitNotEqualTo(String value) {
            addCriterion("BASE_UNIT <>", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitGreaterThan(String value) {
            addCriterion("BASE_UNIT >", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitGreaterThanOrEqualTo(String value) {
            addCriterion("BASE_UNIT >=", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitLessThan(String value) {
            addCriterion("BASE_UNIT <", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitLessThanOrEqualTo(String value) {
            addCriterion("BASE_UNIT <=", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitLike(String value) {
            addCriterion("BASE_UNIT like", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitNotLike(String value) {
            addCriterion("BASE_UNIT not like", value, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitIn(List<String> values) {
            addCriterion("BASE_UNIT in", values, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitNotIn(List<String> values) {
            addCriterion("BASE_UNIT not in", values, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitBetween(String value1, String value2) {
            addCriterion("BASE_UNIT between", value1, value2, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBaseUnitNotBetween(String value1, String value2) {
            addCriterion("BASE_UNIT not between", value1, value2, "baseUnit");
            return (Criteria) this;
        }

        public Criteria andBasePriceIsNull() {
            addCriterion("BASE_PRICE is null");
            return (Criteria) this;
        }

        public Criteria andBasePriceIsNotNull() {
            addCriterion("BASE_PRICE is not null");
            return (Criteria) this;
        }

        public Criteria andBasePriceEqualTo(BigDecimal value) {
            addCriterion("BASE_PRICE =", value, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceNotEqualTo(BigDecimal value) {
            addCriterion("BASE_PRICE <>", value, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceGreaterThan(BigDecimal value) {
            addCriterion("BASE_PRICE >", value, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("BASE_PRICE >=", value, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceLessThan(BigDecimal value) {
            addCriterion("BASE_PRICE <", value, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("BASE_PRICE <=", value, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceIn(List<BigDecimal> values) {
            addCriterion("BASE_PRICE in", values, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceNotIn(List<BigDecimal> values) {
            addCriterion("BASE_PRICE not in", values, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("BASE_PRICE between", value1, value2, "basePrice");
            return (Criteria) this;
        }

        public Criteria andBasePriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("BASE_PRICE not between", value1, value2, "basePrice");
            return (Criteria) this;
        }

        public Criteria andCountIsNull() {
            addCriterion("COUNT is null");
            return (Criteria) this;
        }

        public Criteria andCountIsNotNull() {
            addCriterion("COUNT is not null");
            return (Criteria) this;
        }

        public Criteria andCountEqualTo(Integer value) {
            addCriterion("COUNT =", value, "count");
            return (Criteria) this;
        }

        public Criteria andCountNotEqualTo(Integer value) {
            addCriterion("COUNT <>", value, "count");
            return (Criteria) this;
        }

        public Criteria andCountGreaterThan(Integer value) {
            addCriterion("COUNT >", value, "count");
            return (Criteria) this;
        }

        public Criteria andCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("COUNT >=", value, "count");
            return (Criteria) this;
        }

        public Criteria andCountLessThan(Integer value) {
            addCriterion("COUNT <", value, "count");
            return (Criteria) this;
        }

        public Criteria andCountLessThanOrEqualTo(Integer value) {
            addCriterion("COUNT <=", value, "count");
            return (Criteria) this;
        }

        public Criteria andCountIn(List<Integer> values) {
            addCriterion("COUNT in", values, "count");
            return (Criteria) this;
        }

        public Criteria andCountNotIn(List<Integer> values) {
            addCriterion("COUNT not in", values, "count");
            return (Criteria) this;
        }

        public Criteria andCountBetween(Integer value1, Integer value2) {
            addCriterion("COUNT between", value1, value2, "count");
            return (Criteria) this;
        }

        public Criteria andCountNotBetween(Integer value1, Integer value2) {
            addCriterion("COUNT not between", value1, value2, "count");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeIsNull() {
            addCriterion("MIN_UNIT_CODE is null");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeIsNotNull() {
            addCriterion("MIN_UNIT_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeEqualTo(String value) {
            addCriterion("MIN_UNIT_CODE =", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeNotEqualTo(String value) {
            addCriterion("MIN_UNIT_CODE <>", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeGreaterThan(String value) {
            addCriterion("MIN_UNIT_CODE >", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeGreaterThanOrEqualTo(String value) {
            addCriterion("MIN_UNIT_CODE >=", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeLessThan(String value) {
            addCriterion("MIN_UNIT_CODE <", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeLessThanOrEqualTo(String value) {
            addCriterion("MIN_UNIT_CODE <=", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeLike(String value) {
            addCriterion("MIN_UNIT_CODE like", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeNotLike(String value) {
            addCriterion("MIN_UNIT_CODE not like", value, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeIn(List<String> values) {
            addCriterion("MIN_UNIT_CODE in", values, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeNotIn(List<String> values) {
            addCriterion("MIN_UNIT_CODE not in", values, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeBetween(String value1, String value2) {
            addCriterion("MIN_UNIT_CODE between", value1, value2, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitCodeNotBetween(String value1, String value2) {
            addCriterion("MIN_UNIT_CODE not between", value1, value2, "minUnitCode");
            return (Criteria) this;
        }

        public Criteria andMinUnitIsNull() {
            addCriterion("MIN_UNIT is null");
            return (Criteria) this;
        }

        public Criteria andMinUnitIsNotNull() {
            addCriterion("MIN_UNIT is not null");
            return (Criteria) this;
        }

        public Criteria andMinUnitEqualTo(String value) {
            addCriterion("MIN_UNIT =", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitNotEqualTo(String value) {
            addCriterion("MIN_UNIT <>", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitGreaterThan(String value) {
            addCriterion("MIN_UNIT >", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitGreaterThanOrEqualTo(String value) {
            addCriterion("MIN_UNIT >=", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitLessThan(String value) {
            addCriterion("MIN_UNIT <", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitLessThanOrEqualTo(String value) {
            addCriterion("MIN_UNIT <=", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitLike(String value) {
            addCriterion("MIN_UNIT like", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitNotLike(String value) {
            addCriterion("MIN_UNIT not like", value, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitIn(List<String> values) {
            addCriterion("MIN_UNIT in", values, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitNotIn(List<String> values) {
            addCriterion("MIN_UNIT not in", values, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitBetween(String value1, String value2) {
            addCriterion("MIN_UNIT between", value1, value2, "minUnit");
            return (Criteria) this;
        }

        public Criteria andMinUnitNotBetween(String value1, String value2) {
            addCriterion("MIN_UNIT not between", value1, value2, "minUnit");
            return (Criteria) this;
        }

        public Criteria andTotalPriceIsNull() {
            addCriterion("TOTAL_PRICE is null");
            return (Criteria) this;
        }

        public Criteria andTotalPriceIsNotNull() {
            addCriterion("TOTAL_PRICE is not null");
            return (Criteria) this;
        }

        public Criteria andTotalPriceEqualTo(BigDecimal value) {
            addCriterion("TOTAL_PRICE =", value, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceNotEqualTo(BigDecimal value) {
            addCriterion("TOTAL_PRICE <>", value, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceGreaterThan(BigDecimal value) {
            addCriterion("TOTAL_PRICE >", value, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("TOTAL_PRICE >=", value, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceLessThan(BigDecimal value) {
            addCriterion("TOTAL_PRICE <", value, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("TOTAL_PRICE <=", value, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceIn(List<BigDecimal> values) {
            addCriterion("TOTAL_PRICE in", values, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceNotIn(List<BigDecimal> values) {
            addCriterion("TOTAL_PRICE not in", values, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("TOTAL_PRICE between", value1, value2, "totalPrice");
            return (Criteria) this;
        }

        public Criteria andTotalPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("TOTAL_PRICE not between", value1, value2, "totalPrice");
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