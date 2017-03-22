package com.tasly.deepureflow.domain.deepureflow;

import java.util.ArrayList;
import java.util.List;

public class AgentFlowStockItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AgentFlowStockItemExample() {
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

        public Criteria andAgentFlowShipmentItemIdIsNull() {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID is null");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdIsNotNull() {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID is not null");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdEqualTo(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID =", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdNotEqualTo(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID <>", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdGreaterThan(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID >", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdGreaterThanOrEqualTo(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID >=", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdLessThan(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID <", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdLessThanOrEqualTo(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID <=", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdLike(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID like", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdNotLike(String value) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID not like", value, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdIn(List<String> values) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID in", values, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdNotIn(List<String> values) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID not in", values, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdBetween(String value1, String value2) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID between", value1, value2, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowShipmentItemIdNotBetween(String value1, String value2) {
            addCriterion("AGENT_FLOW_SHIPMENT_ITEM_ID not between", value1, value2, "agentFlowShipmentItemId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdIsNull() {
            addCriterion("AGENT_FLOW_ID is null");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdIsNotNull() {
            addCriterion("AGENT_FLOW_ID is not null");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdEqualTo(String value) {
            addCriterion("AGENT_FLOW_ID =", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdNotEqualTo(String value) {
            addCriterion("AGENT_FLOW_ID <>", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdGreaterThan(String value) {
            addCriterion("AGENT_FLOW_ID >", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdGreaterThanOrEqualTo(String value) {
            addCriterion("AGENT_FLOW_ID >=", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdLessThan(String value) {
            addCriterion("AGENT_FLOW_ID <", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdLessThanOrEqualTo(String value) {
            addCriterion("AGENT_FLOW_ID <=", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdLike(String value) {
            addCriterion("AGENT_FLOW_ID like", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdNotLike(String value) {
            addCriterion("AGENT_FLOW_ID not like", value, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdIn(List<String> values) {
            addCriterion("AGENT_FLOW_ID in", values, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdNotIn(List<String> values) {
            addCriterion("AGENT_FLOW_ID not in", values, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdBetween(String value1, String value2) {
            addCriterion("AGENT_FLOW_ID between", value1, value2, "agentFlowId");
            return (Criteria) this;
        }

        public Criteria andAgentFlowIdNotBetween(String value1, String value2) {
            addCriterion("AGENT_FLOW_ID not between", value1, value2, "agentFlowId");
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

        public Criteria andStockQuantityIsNull() {
            addCriterion("STOCK_QUANTITY is null");
            return (Criteria) this;
        }

        public Criteria andStockQuantityIsNotNull() {
            addCriterion("STOCK_QUANTITY is not null");
            return (Criteria) this;
        }

        public Criteria andStockQuantityEqualTo(Integer value) {
            addCriterion("STOCK_QUANTITY =", value, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityNotEqualTo(Integer value) {
            addCriterion("STOCK_QUANTITY <>", value, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityGreaterThan(Integer value) {
            addCriterion("STOCK_QUANTITY >", value, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("STOCK_QUANTITY >=", value, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityLessThan(Integer value) {
            addCriterion("STOCK_QUANTITY <", value, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("STOCK_QUANTITY <=", value, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityIn(List<Integer> values) {
            addCriterion("STOCK_QUANTITY in", values, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityNotIn(List<Integer> values) {
            addCriterion("STOCK_QUANTITY not in", values, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityBetween(Integer value1, Integer value2) {
            addCriterion("STOCK_QUANTITY between", value1, value2, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("STOCK_QUANTITY not between", value1, value2, "stockQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityIsNull() {
            addCriterion("STOCK_MIN_QUANTITY is null");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityIsNotNull() {
            addCriterion("STOCK_MIN_QUANTITY is not null");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityEqualTo(Integer value) {
            addCriterion("STOCK_MIN_QUANTITY =", value, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityNotEqualTo(Integer value) {
            addCriterion("STOCK_MIN_QUANTITY <>", value, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityGreaterThan(Integer value) {
            addCriterion("STOCK_MIN_QUANTITY >", value, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("STOCK_MIN_QUANTITY >=", value, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityLessThan(Integer value) {
            addCriterion("STOCK_MIN_QUANTITY <", value, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("STOCK_MIN_QUANTITY <=", value, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityIn(List<Integer> values) {
            addCriterion("STOCK_MIN_QUANTITY in", values, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityNotIn(List<Integer> values) {
            addCriterion("STOCK_MIN_QUANTITY not in", values, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityBetween(Integer value1, Integer value2) {
            addCriterion("STOCK_MIN_QUANTITY between", value1, value2, "stockMinQuantity");
            return (Criteria) this;
        }

        public Criteria andStockMinQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("STOCK_MIN_QUANTITY not between", value1, value2, "stockMinQuantity");
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