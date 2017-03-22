package com.tasly.deepureflow.domain.system;

import java.util.ArrayList;
import java.util.List;

public class ZonePlanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ZonePlanExample() {
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

        public Criteria andPlanTypeIsNull() {
            addCriterion("PLAN_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andPlanTypeIsNotNull() {
            addCriterion("PLAN_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andPlanTypeEqualTo(Integer value) {
            addCriterion("PLAN_TYPE =", value, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeNotEqualTo(Integer value) {
            addCriterion("PLAN_TYPE <>", value, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeGreaterThan(Integer value) {
            addCriterion("PLAN_TYPE >", value, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("PLAN_TYPE >=", value, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeLessThan(Integer value) {
            addCriterion("PLAN_TYPE <", value, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeLessThanOrEqualTo(Integer value) {
            addCriterion("PLAN_TYPE <=", value, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeIn(List<Integer> values) {
            addCriterion("PLAN_TYPE in", values, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeNotIn(List<Integer> values) {
            addCriterion("PLAN_TYPE not in", values, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_TYPE between", value1, value2, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_TYPE not between", value1, value2, "planType");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayIsNull() {
            addCriterion("PLAN_START_DAY is null");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayIsNotNull() {
            addCriterion("PLAN_START_DAY is not null");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayEqualTo(Integer value) {
            addCriterion("PLAN_START_DAY =", value, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayNotEqualTo(Integer value) {
            addCriterion("PLAN_START_DAY <>", value, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayGreaterThan(Integer value) {
            addCriterion("PLAN_START_DAY >", value, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayGreaterThanOrEqualTo(Integer value) {
            addCriterion("PLAN_START_DAY >=", value, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayLessThan(Integer value) {
            addCriterion("PLAN_START_DAY <", value, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayLessThanOrEqualTo(Integer value) {
            addCriterion("PLAN_START_DAY <=", value, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayIn(List<Integer> values) {
            addCriterion("PLAN_START_DAY in", values, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayNotIn(List<Integer> values) {
            addCriterion("PLAN_START_DAY not in", values, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_START_DAY between", value1, value2, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanStartDayNotBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_START_DAY not between", value1, value2, "planStartDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayIsNull() {
            addCriterion("PLAN_END_DAY is null");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayIsNotNull() {
            addCriterion("PLAN_END_DAY is not null");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayEqualTo(Integer value) {
            addCriterion("PLAN_END_DAY =", value, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayNotEqualTo(Integer value) {
            addCriterion("PLAN_END_DAY <>", value, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayGreaterThan(Integer value) {
            addCriterion("PLAN_END_DAY >", value, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayGreaterThanOrEqualTo(Integer value) {
            addCriterion("PLAN_END_DAY >=", value, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayLessThan(Integer value) {
            addCriterion("PLAN_END_DAY <", value, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayLessThanOrEqualTo(Integer value) {
            addCriterion("PLAN_END_DAY <=", value, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayIn(List<Integer> values) {
            addCriterion("PLAN_END_DAY in", values, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayNotIn(List<Integer> values) {
            addCriterion("PLAN_END_DAY not in", values, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_END_DAY between", value1, value2, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanEndDayNotBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_END_DAY not between", value1, value2, "planEndDay");
            return (Criteria) this;
        }

        public Criteria andPlanStatusIsNull() {
            addCriterion("PLAN_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andPlanStatusIsNotNull() {
            addCriterion("PLAN_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andPlanStatusEqualTo(Integer value) {
            addCriterion("PLAN_STATUS =", value, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusNotEqualTo(Integer value) {
            addCriterion("PLAN_STATUS <>", value, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusGreaterThan(Integer value) {
            addCriterion("PLAN_STATUS >", value, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("PLAN_STATUS >=", value, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusLessThan(Integer value) {
            addCriterion("PLAN_STATUS <", value, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusLessThanOrEqualTo(Integer value) {
            addCriterion("PLAN_STATUS <=", value, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusIn(List<Integer> values) {
            addCriterion("PLAN_STATUS in", values, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusNotIn(List<Integer> values) {
            addCriterion("PLAN_STATUS not in", values, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_STATUS between", value1, value2, "planStatus");
            return (Criteria) this;
        }

        public Criteria andPlanStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("PLAN_STATUS not between", value1, value2, "planStatus");
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