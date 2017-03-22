package com.tasly.deepureflow.domain.deepureflow;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SalePlanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SalePlanExample() {
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

        public Criteria andSalePlanDateIsNull() {
            addCriterion("SALE_PLAN_DATE is null");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateIsNotNull() {
            addCriterion("SALE_PLAN_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateEqualTo(Date value) {
            addCriterion("SALE_PLAN_DATE =", value, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateNotEqualTo(Date value) {
            addCriterion("SALE_PLAN_DATE <>", value, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateGreaterThan(Date value) {
            addCriterion("SALE_PLAN_DATE >", value, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateGreaterThanOrEqualTo(Date value) {
            addCriterion("SALE_PLAN_DATE >=", value, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateLessThan(Date value) {
            addCriterion("SALE_PLAN_DATE <", value, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateLessThanOrEqualTo(Date value) {
            addCriterion("SALE_PLAN_DATE <=", value, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateIn(List<Date> values) {
            addCriterion("SALE_PLAN_DATE in", values, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateNotIn(List<Date> values) {
            addCriterion("SALE_PLAN_DATE not in", values, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateBetween(Date value1, Date value2) {
            addCriterion("SALE_PLAN_DATE between", value1, value2, "salePlanDate");
            return (Criteria) this;
        }

        public Criteria andSalePlanDateNotBetween(Date value1, Date value2) {
            addCriterion("SALE_PLAN_DATE not between", value1, value2, "salePlanDate");
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

        public Criteria andAgentIdIsNull() {
            addCriterion("AGENT_ID is null");
            return (Criteria) this;
        }

        public Criteria andAgentIdIsNotNull() {
            addCriterion("AGENT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andAgentIdEqualTo(String value) {
            addCriterion("AGENT_ID =", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdNotEqualTo(String value) {
            addCriterion("AGENT_ID <>", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdGreaterThan(String value) {
            addCriterion("AGENT_ID >", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdGreaterThanOrEqualTo(String value) {
            addCriterion("AGENT_ID >=", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdLessThan(String value) {
            addCriterion("AGENT_ID <", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdLessThanOrEqualTo(String value) {
            addCriterion("AGENT_ID <=", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdLike(String value) {
            addCriterion("AGENT_ID like", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdNotLike(String value) {
            addCriterion("AGENT_ID not like", value, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdIn(List<String> values) {
            addCriterion("AGENT_ID in", values, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdNotIn(List<String> values) {
            addCriterion("AGENT_ID not in", values, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdBetween(String value1, String value2) {
            addCriterion("AGENT_ID between", value1, value2, "agentId");
            return (Criteria) this;
        }

        public Criteria andAgentIdNotBetween(String value1, String value2) {
            addCriterion("AGENT_ID not between", value1, value2, "agentId");
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

        public Criteria andSalePlanStatusIsNull() {
            addCriterion("SALE_PLAN_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusIsNotNull() {
            addCriterion("SALE_PLAN_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusEqualTo(Integer value) {
            addCriterion("SALE_PLAN_STATUS =", value, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusNotEqualTo(Integer value) {
            addCriterion("SALE_PLAN_STATUS <>", value, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusGreaterThan(Integer value) {
            addCriterion("SALE_PLAN_STATUS >", value, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("SALE_PLAN_STATUS >=", value, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusLessThan(Integer value) {
            addCriterion("SALE_PLAN_STATUS <", value, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusLessThanOrEqualTo(Integer value) {
            addCriterion("SALE_PLAN_STATUS <=", value, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusIn(List<Integer> values) {
            addCriterion("SALE_PLAN_STATUS in", values, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusNotIn(List<Integer> values) {
            addCriterion("SALE_PLAN_STATUS not in", values, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusBetween(Integer value1, Integer value2) {
            addCriterion("SALE_PLAN_STATUS between", value1, value2, "salePlanStatus");
            return (Criteria) this;
        }

        public Criteria andSalePlanStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("SALE_PLAN_STATUS not between", value1, value2, "salePlanStatus");
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