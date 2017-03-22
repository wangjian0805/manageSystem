package com.tasly.deepureflow.domain.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TerminalExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TerminalExample() {
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

        public Criteria andTerminalNameIsNull() {
            addCriterion("TERMINAL_NAME is null");
            return (Criteria) this;
        }

        public Criteria andTerminalNameIsNotNull() {
            addCriterion("TERMINAL_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalNameEqualTo(String value) {
            addCriterion("TERMINAL_NAME =", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotEqualTo(String value) {
            addCriterion("TERMINAL_NAME <>", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameGreaterThan(String value) {
            addCriterion("TERMINAL_NAME >", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameGreaterThanOrEqualTo(String value) {
            addCriterion("TERMINAL_NAME >=", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameLessThan(String value) {
            addCriterion("TERMINAL_NAME <", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameLessThanOrEqualTo(String value) {
            addCriterion("TERMINAL_NAME <=", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameLike(String value) {
            addCriterion("TERMINAL_NAME like", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotLike(String value) {
            addCriterion("TERMINAL_NAME not like", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameIn(List<String> values) {
            addCriterion("TERMINAL_NAME in", values, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotIn(List<String> values) {
            addCriterion("TERMINAL_NAME not in", values, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameBetween(String value1, String value2) {
            addCriterion("TERMINAL_NAME between", value1, value2, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotBetween(String value1, String value2) {
            addCriterion("TERMINAL_NAME not between", value1, value2, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeIsNull() {
            addCriterion("TERMINAL_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeIsNotNull() {
            addCriterion("TERMINAL_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeEqualTo(Integer value) {
            addCriterion("TERMINAL_TYPE =", value, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeNotEqualTo(Integer value) {
            addCriterion("TERMINAL_TYPE <>", value, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeGreaterThan(Integer value) {
            addCriterion("TERMINAL_TYPE >", value, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_TYPE >=", value, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeLessThan(Integer value) {
            addCriterion("TERMINAL_TYPE <", value, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeLessThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_TYPE <=", value, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeIn(List<Integer> values) {
            addCriterion("TERMINAL_TYPE in", values, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeNotIn(List<Integer> values) {
            addCriterion("TERMINAL_TYPE not in", values, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_TYPE between", value1, value2, "terminalType");
            return (Criteria) this;
        }

        public Criteria andTerminalTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_TYPE not between", value1, value2, "terminalType");
            return (Criteria) this;
        }

        public Criteria andErpCodeIsNull() {
            addCriterion("ERP_CODE is null");
            return (Criteria) this;
        }

        public Criteria andErpCodeIsNotNull() {
            addCriterion("ERP_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andErpCodeEqualTo(String value) {
            addCriterion("ERP_CODE =", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeNotEqualTo(String value) {
            addCriterion("ERP_CODE <>", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeGreaterThan(String value) {
            addCriterion("ERP_CODE >", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeGreaterThanOrEqualTo(String value) {
            addCriterion("ERP_CODE >=", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeLessThan(String value) {
            addCriterion("ERP_CODE <", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeLessThanOrEqualTo(String value) {
            addCriterion("ERP_CODE <=", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeLike(String value) {
            addCriterion("ERP_CODE like", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeNotLike(String value) {
            addCriterion("ERP_CODE not like", value, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeIn(List<String> values) {
            addCriterion("ERP_CODE in", values, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeNotIn(List<String> values) {
            addCriterion("ERP_CODE not in", values, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeBetween(String value1, String value2) {
            addCriterion("ERP_CODE between", value1, value2, "erpCode");
            return (Criteria) this;
        }

        public Criteria andErpCodeNotBetween(String value1, String value2) {
            addCriterion("ERP_CODE not between", value1, value2, "erpCode");
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

        public Criteria andStationCodeIsNull() {
            addCriterion("STATION_CODE is null");
            return (Criteria) this;
        }

        public Criteria andStationCodeIsNotNull() {
            addCriterion("STATION_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andStationCodeEqualTo(String value) {
            addCriterion("STATION_CODE =", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeNotEqualTo(String value) {
            addCriterion("STATION_CODE <>", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeGreaterThan(String value) {
            addCriterion("STATION_CODE >", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeGreaterThanOrEqualTo(String value) {
            addCriterion("STATION_CODE >=", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeLessThan(String value) {
            addCriterion("STATION_CODE <", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeLessThanOrEqualTo(String value) {
            addCriterion("STATION_CODE <=", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeLike(String value) {
            addCriterion("STATION_CODE like", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeNotLike(String value) {
            addCriterion("STATION_CODE not like", value, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeIn(List<String> values) {
            addCriterion("STATION_CODE in", values, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeNotIn(List<String> values) {
            addCriterion("STATION_CODE not in", values, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeBetween(String value1, String value2) {
            addCriterion("STATION_CODE between", value1, value2, "stationCode");
            return (Criteria) this;
        }

        public Criteria andStationCodeNotBetween(String value1, String value2) {
            addCriterion("STATION_CODE not between", value1, value2, "stationCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeIsNull() {
            addCriterion("OFFICE_CODE is null");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeIsNotNull() {
            addCriterion("OFFICE_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeEqualTo(String value) {
            addCriterion("OFFICE_CODE =", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeNotEqualTo(String value) {
            addCriterion("OFFICE_CODE <>", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeGreaterThan(String value) {
            addCriterion("OFFICE_CODE >", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeGreaterThanOrEqualTo(String value) {
            addCriterion("OFFICE_CODE >=", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeLessThan(String value) {
            addCriterion("OFFICE_CODE <", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeLessThanOrEqualTo(String value) {
            addCriterion("OFFICE_CODE <=", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeLike(String value) {
            addCriterion("OFFICE_CODE like", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeNotLike(String value) {
            addCriterion("OFFICE_CODE not like", value, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeIn(List<String> values) {
            addCriterion("OFFICE_CODE in", values, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeNotIn(List<String> values) {
            addCriterion("OFFICE_CODE not in", values, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeBetween(String value1, String value2) {
            addCriterion("OFFICE_CODE between", value1, value2, "officeCode");
            return (Criteria) this;
        }

        public Criteria andOfficeCodeNotBetween(String value1, String value2) {
            addCriterion("OFFICE_CODE not between", value1, value2, "officeCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeIsNull() {
            addCriterion("ZONE_CODE is null");
            return (Criteria) this;
        }

        public Criteria andZoneCodeIsNotNull() {
            addCriterion("ZONE_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andZoneCodeEqualTo(String value) {
            addCriterion("ZONE_CODE =", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeNotEqualTo(String value) {
            addCriterion("ZONE_CODE <>", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeGreaterThan(String value) {
            addCriterion("ZONE_CODE >", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeGreaterThanOrEqualTo(String value) {
            addCriterion("ZONE_CODE >=", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeLessThan(String value) {
            addCriterion("ZONE_CODE <", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeLessThanOrEqualTo(String value) {
            addCriterion("ZONE_CODE <=", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeLike(String value) {
            addCriterion("ZONE_CODE like", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeNotLike(String value) {
            addCriterion("ZONE_CODE not like", value, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeIn(List<String> values) {
            addCriterion("ZONE_CODE in", values, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeNotIn(List<String> values) {
            addCriterion("ZONE_CODE not in", values, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeBetween(String value1, String value2) {
            addCriterion("ZONE_CODE between", value1, value2, "zoneCode");
            return (Criteria) this;
        }

        public Criteria andZoneCodeNotBetween(String value1, String value2) {
            addCriterion("ZONE_CODE not between", value1, value2, "zoneCode");
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

        public Criteria andTerminalStatusIsNull() {
            addCriterion("TERMINAL_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusIsNotNull() {
            addCriterion("TERMINAL_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusEqualTo(Integer value) {
            addCriterion("TERMINAL_STATUS =", value, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusNotEqualTo(Integer value) {
            addCriterion("TERMINAL_STATUS <>", value, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusGreaterThan(Integer value) {
            addCriterion("TERMINAL_STATUS >", value, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_STATUS >=", value, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusLessThan(Integer value) {
            addCriterion("TERMINAL_STATUS <", value, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusLessThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_STATUS <=", value, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusIn(List<Integer> values) {
            addCriterion("TERMINAL_STATUS in", values, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusNotIn(List<Integer> values) {
            addCriterion("TERMINAL_STATUS not in", values, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_STATUS between", value1, value2, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andTerminalStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_STATUS not between", value1, value2, "terminalStatus");
            return (Criteria) this;
        }

        public Criteria andPlanDateIsNull() {
            addCriterion("PLAN_DATE is null");
            return (Criteria) this;
        }

        public Criteria andPlanDateIsNotNull() {
            addCriterion("PLAN_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andPlanDateEqualTo(Date value) {
            addCriterion("PLAN_DATE =", value, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateNotEqualTo(Date value) {
            addCriterion("PLAN_DATE <>", value, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateGreaterThan(Date value) {
            addCriterion("PLAN_DATE >", value, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateGreaterThanOrEqualTo(Date value) {
            addCriterion("PLAN_DATE >=", value, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateLessThan(Date value) {
            addCriterion("PLAN_DATE <", value, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateLessThanOrEqualTo(Date value) {
            addCriterion("PLAN_DATE <=", value, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateIn(List<Date> values) {
            addCriterion("PLAN_DATE in", values, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateNotIn(List<Date> values) {
            addCriterion("PLAN_DATE not in", values, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateBetween(Date value1, Date value2) {
            addCriterion("PLAN_DATE between", value1, value2, "planDate");
            return (Criteria) this;
        }

        public Criteria andPlanDateNotBetween(Date value1, Date value2) {
            addCriterion("PLAN_DATE not between", value1, value2, "planDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateIsNull() {
            addCriterion("JOIN_DATE is null");
            return (Criteria) this;
        }

        public Criteria andJoinDateIsNotNull() {
            addCriterion("JOIN_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andJoinDateEqualTo(Date value) {
            addCriterion("JOIN_DATE =", value, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateNotEqualTo(Date value) {
            addCriterion("JOIN_DATE <>", value, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateGreaterThan(Date value) {
            addCriterion("JOIN_DATE >", value, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateGreaterThanOrEqualTo(Date value) {
            addCriterion("JOIN_DATE >=", value, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateLessThan(Date value) {
            addCriterion("JOIN_DATE <", value, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateLessThanOrEqualTo(Date value) {
            addCriterion("JOIN_DATE <=", value, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateIn(List<Date> values) {
            addCriterion("JOIN_DATE in", values, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateNotIn(List<Date> values) {
            addCriterion("JOIN_DATE not in", values, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateBetween(Date value1, Date value2) {
            addCriterion("JOIN_DATE between", value1, value2, "joinDate");
            return (Criteria) this;
        }

        public Criteria andJoinDateNotBetween(Date value1, Date value2) {
            addCriterion("JOIN_DATE not between", value1, value2, "joinDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("CREATE_DATE is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("CREATE_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("CREATE_DATE =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("CREATE_DATE <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("CREATE_DATE >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATE_DATE >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("CREATE_DATE <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("CREATE_DATE <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("CREATE_DATE in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("CREATE_DATE not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("CREATE_DATE between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("CREATE_DATE not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressIsNull() {
            addCriterion("TERMINAL_ADDRESS is null");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressIsNotNull() {
            addCriterion("TERMINAL_ADDRESS is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressEqualTo(String value) {
            addCriterion("TERMINAL_ADDRESS =", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotEqualTo(String value) {
            addCriterion("TERMINAL_ADDRESS <>", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressGreaterThan(String value) {
            addCriterion("TERMINAL_ADDRESS >", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressGreaterThanOrEqualTo(String value) {
            addCriterion("TERMINAL_ADDRESS >=", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressLessThan(String value) {
            addCriterion("TERMINAL_ADDRESS <", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressLessThanOrEqualTo(String value) {
            addCriterion("TERMINAL_ADDRESS <=", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressLike(String value) {
            addCriterion("TERMINAL_ADDRESS like", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotLike(String value) {
            addCriterion("TERMINAL_ADDRESS not like", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressIn(List<String> values) {
            addCriterion("TERMINAL_ADDRESS in", values, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotIn(List<String> values) {
            addCriterion("TERMINAL_ADDRESS not in", values, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressBetween(String value1, String value2) {
            addCriterion("TERMINAL_ADDRESS between", value1, value2, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotBetween(String value1, String value2) {
            addCriterion("TERMINAL_ADDRESS not between", value1, value2, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictIsNull() {
            addCriterion("TERMINAL_DISTRICT is null");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictIsNotNull() {
            addCriterion("TERMINAL_DISTRICT is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictEqualTo(Integer value) {
            addCriterion("TERMINAL_DISTRICT =", value, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictNotEqualTo(Integer value) {
            addCriterion("TERMINAL_DISTRICT <>", value, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictGreaterThan(Integer value) {
            addCriterion("TERMINAL_DISTRICT >", value, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictGreaterThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_DISTRICT >=", value, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictLessThan(Integer value) {
            addCriterion("TERMINAL_DISTRICT <", value, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictLessThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_DISTRICT <=", value, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictIn(List<Integer> values) {
            addCriterion("TERMINAL_DISTRICT in", values, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictNotIn(List<Integer> values) {
            addCriterion("TERMINAL_DISTRICT not in", values, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_DISTRICT between", value1, value2, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalDistrictNotBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_DISTRICT not between", value1, value2, "terminalDistrict");
            return (Criteria) this;
        }

        public Criteria andTerminalCityIsNull() {
            addCriterion("TERMINAL_CITY is null");
            return (Criteria) this;
        }

        public Criteria andTerminalCityIsNotNull() {
            addCriterion("TERMINAL_CITY is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalCityEqualTo(Integer value) {
            addCriterion("TERMINAL_CITY =", value, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityNotEqualTo(Integer value) {
            addCriterion("TERMINAL_CITY <>", value, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityGreaterThan(Integer value) {
            addCriterion("TERMINAL_CITY >", value, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityGreaterThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_CITY >=", value, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityLessThan(Integer value) {
            addCriterion("TERMINAL_CITY <", value, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityLessThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_CITY <=", value, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityIn(List<Integer> values) {
            addCriterion("TERMINAL_CITY in", values, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityNotIn(List<Integer> values) {
            addCriterion("TERMINAL_CITY not in", values, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_CITY between", value1, value2, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalCityNotBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_CITY not between", value1, value2, "terminalCity");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceIsNull() {
            addCriterion("TERMINAL_PROVINCE is null");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceIsNotNull() {
            addCriterion("TERMINAL_PROVINCE is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceEqualTo(Integer value) {
            addCriterion("TERMINAL_PROVINCE =", value, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceNotEqualTo(Integer value) {
            addCriterion("TERMINAL_PROVINCE <>", value, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceGreaterThan(Integer value) {
            addCriterion("TERMINAL_PROVINCE >", value, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceGreaterThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_PROVINCE >=", value, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceLessThan(Integer value) {
            addCriterion("TERMINAL_PROVINCE <", value, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceLessThanOrEqualTo(Integer value) {
            addCriterion("TERMINAL_PROVINCE <=", value, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceIn(List<Integer> values) {
            addCriterion("TERMINAL_PROVINCE in", values, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceNotIn(List<Integer> values) {
            addCriterion("TERMINAL_PROVINCE not in", values, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_PROVINCE between", value1, value2, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andTerminalProvinceNotBetween(Integer value1, Integer value2) {
            addCriterion("TERMINAL_PROVINCE not between", value1, value2, "terminalProvince");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsIsNull() {
            addCriterion("PRODUCT_CATEGORY_IDS is null");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsIsNotNull() {
            addCriterion("PRODUCT_CATEGORY_IDS is not null");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsEqualTo(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS =", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsNotEqualTo(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS <>", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsGreaterThan(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS >", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsGreaterThanOrEqualTo(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS >=", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsLessThan(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS <", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsLessThanOrEqualTo(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS <=", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsLike(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS like", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsNotLike(String value) {
            addCriterion("PRODUCT_CATEGORY_IDS not like", value, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsIn(List<String> values) {
            addCriterion("PRODUCT_CATEGORY_IDS in", values, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsNotIn(List<String> values) {
            addCriterion("PRODUCT_CATEGORY_IDS not in", values, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsBetween(String value1, String value2) {
            addCriterion("PRODUCT_CATEGORY_IDS between", value1, value2, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdsNotBetween(String value1, String value2) {
            addCriterion("PRODUCT_CATEGORY_IDS not between", value1, value2, "productCategoryIds");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIsNull() {
            addCriterion("IS_DELETE is null");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIsNotNull() {
            addCriterion("IS_DELETE is not null");
            return (Criteria) this;
        }

        public Criteria andIsDeleteEqualTo(Integer value) {
            addCriterion("IS_DELETE =", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotEqualTo(Integer value) {
            addCriterion("IS_DELETE <>", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteGreaterThan(Integer value) {
            addCriterion("IS_DELETE >", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteGreaterThanOrEqualTo(Integer value) {
            addCriterion("IS_DELETE >=", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteLessThan(Integer value) {
            addCriterion("IS_DELETE <", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteLessThanOrEqualTo(Integer value) {
            addCriterion("IS_DELETE <=", value, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteIn(List<Integer> values) {
            addCriterion("IS_DELETE in", values, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotIn(List<Integer> values) {
            addCriterion("IS_DELETE not in", values, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteBetween(Integer value1, Integer value2) {
            addCriterion("IS_DELETE between", value1, value2, "isDelete");
            return (Criteria) this;
        }

        public Criteria andIsDeleteNotBetween(Integer value1, Integer value2) {
            addCriterion("IS_DELETE not between", value1, value2, "isDelete");
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