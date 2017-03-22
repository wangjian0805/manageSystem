package com.tasly.deepureflow.domain.deepureflow;

import java.util.ArrayList;
import java.util.List;

public class AgentFlowShipmentItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AgentFlowShipmentItemExample() {
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

        public Criteria andShipmentQuantityIsNull() {
            addCriterion("SHIPMENT_QUANTITY is null");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityIsNotNull() {
            addCriterion("SHIPMENT_QUANTITY is not null");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityEqualTo(Integer value) {
            addCriterion("SHIPMENT_QUANTITY =", value, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityNotEqualTo(Integer value) {
            addCriterion("SHIPMENT_QUANTITY <>", value, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityGreaterThan(Integer value) {
            addCriterion("SHIPMENT_QUANTITY >", value, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("SHIPMENT_QUANTITY >=", value, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityLessThan(Integer value) {
            addCriterion("SHIPMENT_QUANTITY <", value, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("SHIPMENT_QUANTITY <=", value, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityIn(List<Integer> values) {
            addCriterion("SHIPMENT_QUANTITY in", values, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityNotIn(List<Integer> values) {
            addCriterion("SHIPMENT_QUANTITY not in", values, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityBetween(Integer value1, Integer value2) {
            addCriterion("SHIPMENT_QUANTITY between", value1, value2, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("SHIPMENT_QUANTITY not between", value1, value2, "shipmentQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityIsNull() {
            addCriterion("SHIPMENT_MIN_QUANTITY is null");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityIsNotNull() {
            addCriterion("SHIPMENT_MIN_QUANTITY is not null");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityEqualTo(Integer value) {
            addCriterion("SHIPMENT_MIN_QUANTITY =", value, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityNotEqualTo(Integer value) {
            addCriterion("SHIPMENT_MIN_QUANTITY <>", value, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityGreaterThan(Integer value) {
            addCriterion("SHIPMENT_MIN_QUANTITY >", value, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("SHIPMENT_MIN_QUANTITY >=", value, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityLessThan(Integer value) {
            addCriterion("SHIPMENT_MIN_QUANTITY <", value, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("SHIPMENT_MIN_QUANTITY <=", value, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityIn(List<Integer> values) {
            addCriterion("SHIPMENT_MIN_QUANTITY in", values, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityNotIn(List<Integer> values) {
            addCriterion("SHIPMENT_MIN_QUANTITY not in", values, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityBetween(Integer value1, Integer value2) {
            addCriterion("SHIPMENT_MIN_QUANTITY between", value1, value2, "shipmentMinQuantity");
            return (Criteria) this;
        }

        public Criteria andShipmentMinQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("SHIPMENT_MIN_QUANTITY not between", value1, value2, "shipmentMinQuantity");
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

        public Criteria andTerminalIdIsNull() {
            addCriterion("TERMINAL_ID is null");
            return (Criteria) this;
        }

        public Criteria andTerminalIdIsNotNull() {
            addCriterion("TERMINAL_ID is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalIdEqualTo(String value) {
            addCriterion("TERMINAL_ID =", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdNotEqualTo(String value) {
            addCriterion("TERMINAL_ID <>", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdGreaterThan(String value) {
            addCriterion("TERMINAL_ID >", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdGreaterThanOrEqualTo(String value) {
            addCriterion("TERMINAL_ID >=", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdLessThan(String value) {
            addCriterion("TERMINAL_ID <", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdLessThanOrEqualTo(String value) {
            addCriterion("TERMINAL_ID <=", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdLike(String value) {
            addCriterion("TERMINAL_ID like", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdNotLike(String value) {
            addCriterion("TERMINAL_ID not like", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdIn(List<String> values) {
            addCriterion("TERMINAL_ID in", values, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdNotIn(List<String> values) {
            addCriterion("TERMINAL_ID not in", values, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdBetween(String value1, String value2) {
            addCriterion("TERMINAL_ID between", value1, value2, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdNotBetween(String value1, String value2) {
            addCriterion("TERMINAL_ID not between", value1, value2, "terminalId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdIsNull() {
            addCriterion("HIERARCHY_ID is null");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdIsNotNull() {
            addCriterion("HIERARCHY_ID is not null");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdEqualTo(String value) {
            addCriterion("HIERARCHY_ID =", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdNotEqualTo(String value) {
            addCriterion("HIERARCHY_ID <>", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdGreaterThan(String value) {
            addCriterion("HIERARCHY_ID >", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdGreaterThanOrEqualTo(String value) {
            addCriterion("HIERARCHY_ID >=", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdLessThan(String value) {
            addCriterion("HIERARCHY_ID <", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdLessThanOrEqualTo(String value) {
            addCriterion("HIERARCHY_ID <=", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdLike(String value) {
            addCriterion("HIERARCHY_ID like", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdNotLike(String value) {
            addCriterion("HIERARCHY_ID not like", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdIn(List<String> values) {
            addCriterion("HIERARCHY_ID in", values, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdNotIn(List<String> values) {
            addCriterion("HIERARCHY_ID not in", values, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdBetween(String value1, String value2) {
            addCriterion("HIERARCHY_ID between", value1, value2, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdNotBetween(String value1, String value2) {
            addCriterion("HIERARCHY_ID not between", value1, value2, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andChannelIdIsNull() {
            addCriterion("CHANNEL_ID is null");
            return (Criteria) this;
        }

        public Criteria andChannelIdIsNotNull() {
            addCriterion("CHANNEL_ID is not null");
            return (Criteria) this;
        }

        public Criteria andChannelIdEqualTo(String value) {
            addCriterion("CHANNEL_ID =", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdNotEqualTo(String value) {
            addCriterion("CHANNEL_ID <>", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdGreaterThan(String value) {
            addCriterion("CHANNEL_ID >", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdGreaterThanOrEqualTo(String value) {
            addCriterion("CHANNEL_ID >=", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdLessThan(String value) {
            addCriterion("CHANNEL_ID <", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdLessThanOrEqualTo(String value) {
            addCriterion("CHANNEL_ID <=", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdLike(String value) {
            addCriterion("CHANNEL_ID like", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdNotLike(String value) {
            addCriterion("CHANNEL_ID not like", value, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdIn(List<String> values) {
            addCriterion("CHANNEL_ID in", values, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdNotIn(List<String> values) {
            addCriterion("CHANNEL_ID not in", values, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdBetween(String value1, String value2) {
            addCriterion("CHANNEL_ID between", value1, value2, "channelId");
            return (Criteria) this;
        }

        public Criteria andChannelIdNotBetween(String value1, String value2) {
            addCriterion("CHANNEL_ID not between", value1, value2, "channelId");
            return (Criteria) this;
        }

        public Criteria andStationIdIsNull() {
            addCriterion("STATION_ID is null");
            return (Criteria) this;
        }

        public Criteria andStationIdIsNotNull() {
            addCriterion("STATION_ID is not null");
            return (Criteria) this;
        }

        public Criteria andStationIdEqualTo(String value) {
            addCriterion("STATION_ID =", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdNotEqualTo(String value) {
            addCriterion("STATION_ID <>", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdGreaterThan(String value) {
            addCriterion("STATION_ID >", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdGreaterThanOrEqualTo(String value) {
            addCriterion("STATION_ID >=", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdLessThan(String value) {
            addCriterion("STATION_ID <", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdLessThanOrEqualTo(String value) {
            addCriterion("STATION_ID <=", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdLike(String value) {
            addCriterion("STATION_ID like", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdNotLike(String value) {
            addCriterion("STATION_ID not like", value, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdIn(List<String> values) {
            addCriterion("STATION_ID in", values, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdNotIn(List<String> values) {
            addCriterion("STATION_ID not in", values, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdBetween(String value1, String value2) {
            addCriterion("STATION_ID between", value1, value2, "stationId");
            return (Criteria) this;
        }

        public Criteria andStationIdNotBetween(String value1, String value2) {
            addCriterion("STATION_ID not between", value1, value2, "stationId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdIsNull() {
            addCriterion("OFFICE_ID is null");
            return (Criteria) this;
        }

        public Criteria andOfficeIdIsNotNull() {
            addCriterion("OFFICE_ID is not null");
            return (Criteria) this;
        }

        public Criteria andOfficeIdEqualTo(String value) {
            addCriterion("OFFICE_ID =", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdNotEqualTo(String value) {
            addCriterion("OFFICE_ID <>", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdGreaterThan(String value) {
            addCriterion("OFFICE_ID >", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdGreaterThanOrEqualTo(String value) {
            addCriterion("OFFICE_ID >=", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdLessThan(String value) {
            addCriterion("OFFICE_ID <", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdLessThanOrEqualTo(String value) {
            addCriterion("OFFICE_ID <=", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdLike(String value) {
            addCriterion("OFFICE_ID like", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdNotLike(String value) {
            addCriterion("OFFICE_ID not like", value, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdIn(List<String> values) {
            addCriterion("OFFICE_ID in", values, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdNotIn(List<String> values) {
            addCriterion("OFFICE_ID not in", values, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdBetween(String value1, String value2) {
            addCriterion("OFFICE_ID between", value1, value2, "officeId");
            return (Criteria) this;
        }

        public Criteria andOfficeIdNotBetween(String value1, String value2) {
            addCriterion("OFFICE_ID not between", value1, value2, "officeId");
            return (Criteria) this;
        }

        public Criteria andZoneIdIsNull() {
            addCriterion("ZONE_ID is null");
            return (Criteria) this;
        }

        public Criteria andZoneIdIsNotNull() {
            addCriterion("ZONE_ID is not null");
            return (Criteria) this;
        }

        public Criteria andZoneIdEqualTo(String value) {
            addCriterion("ZONE_ID =", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdNotEqualTo(String value) {
            addCriterion("ZONE_ID <>", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdGreaterThan(String value) {
            addCriterion("ZONE_ID >", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdGreaterThanOrEqualTo(String value) {
            addCriterion("ZONE_ID >=", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdLessThan(String value) {
            addCriterion("ZONE_ID <", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdLessThanOrEqualTo(String value) {
            addCriterion("ZONE_ID <=", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdLike(String value) {
            addCriterion("ZONE_ID like", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdNotLike(String value) {
            addCriterion("ZONE_ID not like", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdIn(List<String> values) {
            addCriterion("ZONE_ID in", values, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdNotIn(List<String> values) {
            addCriterion("ZONE_ID not in", values, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdBetween(String value1, String value2) {
            addCriterion("ZONE_ID between", value1, value2, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdNotBetween(String value1, String value2) {
            addCriterion("ZONE_ID not between", value1, value2, "zoneId");
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