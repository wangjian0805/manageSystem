package com.tasly.deepureflow.domain.system;

import java.util.ArrayList;
import java.util.List;

public class ZoneExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ZoneExample() {
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

        public Criteria andZoneIdIsNull() {
            addCriterion("ZONE_ID is null");
            return (Criteria) this;
        }

        public Criteria andZoneIdIsNotNull() {
            addCriterion("ZONE_ID is not null");
            return (Criteria) this;
        }

        public Criteria andZoneIdEqualTo(Integer value) {
            addCriterion("ZONE_ID =", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdNotEqualTo(Integer value) {
            addCriterion("ZONE_ID <>", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdGreaterThan(Integer value) {
            addCriterion("ZONE_ID >", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ZONE_ID >=", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdLessThan(Integer value) {
            addCriterion("ZONE_ID <", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdLessThanOrEqualTo(Integer value) {
            addCriterion("ZONE_ID <=", value, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdIn(List<Integer> values) {
            addCriterion("ZONE_ID in", values, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdNotIn(List<Integer> values) {
            addCriterion("ZONE_ID not in", values, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdBetween(Integer value1, Integer value2) {
            addCriterion("ZONE_ID between", value1, value2, "zoneId");
            return (Criteria) this;
        }

        public Criteria andZoneIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ZONE_ID not between", value1, value2, "zoneId");
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

        public Criteria andZoneNameIsNull() {
            addCriterion("ZONE_NAME is null");
            return (Criteria) this;
        }

        public Criteria andZoneNameIsNotNull() {
            addCriterion("ZONE_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andZoneNameEqualTo(String value) {
            addCriterion("ZONE_NAME =", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameNotEqualTo(String value) {
            addCriterion("ZONE_NAME <>", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameGreaterThan(String value) {
            addCriterion("ZONE_NAME >", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameGreaterThanOrEqualTo(String value) {
            addCriterion("ZONE_NAME >=", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameLessThan(String value) {
            addCriterion("ZONE_NAME <", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameLessThanOrEqualTo(String value) {
            addCriterion("ZONE_NAME <=", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameLike(String value) {
            addCriterion("ZONE_NAME like", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameNotLike(String value) {
            addCriterion("ZONE_NAME not like", value, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameIn(List<String> values) {
            addCriterion("ZONE_NAME in", values, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameNotIn(List<String> values) {
            addCriterion("ZONE_NAME not in", values, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameBetween(String value1, String value2) {
            addCriterion("ZONE_NAME between", value1, value2, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZoneNameNotBetween(String value1, String value2) {
            addCriterion("ZONE_NAME not between", value1, value2, "zoneName");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusIsNull() {
            addCriterion("ZONE_PLAN_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusIsNotNull() {
            addCriterion("ZONE_PLAN_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusEqualTo(Integer value) {
            addCriterion("ZONE_PLAN_STATUS =", value, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusNotEqualTo(Integer value) {
            addCriterion("ZONE_PLAN_STATUS <>", value, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusGreaterThan(Integer value) {
            addCriterion("ZONE_PLAN_STATUS >", value, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("ZONE_PLAN_STATUS >=", value, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusLessThan(Integer value) {
            addCriterion("ZONE_PLAN_STATUS <", value, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusLessThanOrEqualTo(Integer value) {
            addCriterion("ZONE_PLAN_STATUS <=", value, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusIn(List<Integer> values) {
            addCriterion("ZONE_PLAN_STATUS in", values, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusNotIn(List<Integer> values) {
            addCriterion("ZONE_PLAN_STATUS not in", values, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusBetween(Integer value1, Integer value2) {
            addCriterion("ZONE_PLAN_STATUS between", value1, value2, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZonePlanStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("ZONE_PLAN_STATUS not between", value1, value2, "zonePlanStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusIsNull() {
            addCriterion("ZONE_FLOW_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusIsNotNull() {
            addCriterion("ZONE_FLOW_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusEqualTo(Integer value) {
            addCriterion("ZONE_FLOW_STATUS =", value, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusNotEqualTo(Integer value) {
            addCriterion("ZONE_FLOW_STATUS <>", value, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusGreaterThan(Integer value) {
            addCriterion("ZONE_FLOW_STATUS >", value, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("ZONE_FLOW_STATUS >=", value, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusLessThan(Integer value) {
            addCriterion("ZONE_FLOW_STATUS <", value, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusLessThanOrEqualTo(Integer value) {
            addCriterion("ZONE_FLOW_STATUS <=", value, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusIn(List<Integer> values) {
            addCriterion("ZONE_FLOW_STATUS in", values, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusNotIn(List<Integer> values) {
            addCriterion("ZONE_FLOW_STATUS not in", values, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusBetween(Integer value1, Integer value2) {
            addCriterion("ZONE_FLOW_STATUS between", value1, value2, "zoneFlowStatus");
            return (Criteria) this;
        }

        public Criteria andZoneFlowStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("ZONE_FLOW_STATUS not between", value1, value2, "zoneFlowStatus");
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