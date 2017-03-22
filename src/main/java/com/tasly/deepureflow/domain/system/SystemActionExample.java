package com.tasly.deepureflow.domain.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SystemActionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SystemActionExample() {
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

        public Criteria andActionIdIsNull() {
            addCriterion("ACTION_ID is null");
            return (Criteria) this;
        }

        public Criteria andActionIdIsNotNull() {
            addCriterion("ACTION_ID is not null");
            return (Criteria) this;
        }

        public Criteria andActionIdEqualTo(Integer value) {
            addCriterion("ACTION_ID =", value, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdNotEqualTo(Integer value) {
            addCriterion("ACTION_ID <>", value, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdGreaterThan(Integer value) {
            addCriterion("ACTION_ID >", value, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ACTION_ID >=", value, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdLessThan(Integer value) {
            addCriterion("ACTION_ID <", value, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdLessThanOrEqualTo(Integer value) {
            addCriterion("ACTION_ID <=", value, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdIn(List<Integer> values) {
            addCriterion("ACTION_ID in", values, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdNotIn(List<Integer> values) {
            addCriterion("ACTION_ID not in", values, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdBetween(Integer value1, Integer value2) {
            addCriterion("ACTION_ID between", value1, value2, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ACTION_ID not between", value1, value2, "actionId");
            return (Criteria) this;
        }

        public Criteria andActionUrlIsNull() {
            addCriterion("ACTION_URL is null");
            return (Criteria) this;
        }

        public Criteria andActionUrlIsNotNull() {
            addCriterion("ACTION_URL is not null");
            return (Criteria) this;
        }

        public Criteria andActionUrlEqualTo(String value) {
            addCriterion("ACTION_URL =", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlNotEqualTo(String value) {
            addCriterion("ACTION_URL <>", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlGreaterThan(String value) {
            addCriterion("ACTION_URL >", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlGreaterThanOrEqualTo(String value) {
            addCriterion("ACTION_URL >=", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlLessThan(String value) {
            addCriterion("ACTION_URL <", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlLessThanOrEqualTo(String value) {
            addCriterion("ACTION_URL <=", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlLike(String value) {
            addCriterion("ACTION_URL like", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlNotLike(String value) {
            addCriterion("ACTION_URL not like", value, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlIn(List<String> values) {
            addCriterion("ACTION_URL in", values, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlNotIn(List<String> values) {
            addCriterion("ACTION_URL not in", values, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlBetween(String value1, String value2) {
            addCriterion("ACTION_URL between", value1, value2, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionUrlNotBetween(String value1, String value2) {
            addCriterion("ACTION_URL not between", value1, value2, "actionUrl");
            return (Criteria) this;
        }

        public Criteria andActionTypeIsNull() {
            addCriterion("ACTION_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andActionTypeIsNotNull() {
            addCriterion("ACTION_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andActionTypeEqualTo(Integer value) {
            addCriterion("ACTION_TYPE =", value, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeNotEqualTo(Integer value) {
            addCriterion("ACTION_TYPE <>", value, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeGreaterThan(Integer value) {
            addCriterion("ACTION_TYPE >", value, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("ACTION_TYPE >=", value, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeLessThan(Integer value) {
            addCriterion("ACTION_TYPE <", value, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeLessThanOrEqualTo(Integer value) {
            addCriterion("ACTION_TYPE <=", value, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeIn(List<Integer> values) {
            addCriterion("ACTION_TYPE in", values, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeNotIn(List<Integer> values) {
            addCriterion("ACTION_TYPE not in", values, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeBetween(Integer value1, Integer value2) {
            addCriterion("ACTION_TYPE between", value1, value2, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("ACTION_TYPE not between", value1, value2, "actionType");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeIsNull() {
            addCriterion("ACTION_OPERATION_TIME is null");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeIsNotNull() {
            addCriterion("ACTION_OPERATION_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeEqualTo(Date value) {
            addCriterion("ACTION_OPERATION_TIME =", value, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeNotEqualTo(Date value) {
            addCriterion("ACTION_OPERATION_TIME <>", value, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeGreaterThan(Date value) {
            addCriterion("ACTION_OPERATION_TIME >", value, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("ACTION_OPERATION_TIME >=", value, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeLessThan(Date value) {
            addCriterion("ACTION_OPERATION_TIME <", value, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeLessThanOrEqualTo(Date value) {
            addCriterion("ACTION_OPERATION_TIME <=", value, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeIn(List<Date> values) {
            addCriterion("ACTION_OPERATION_TIME in", values, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeNotIn(List<Date> values) {
            addCriterion("ACTION_OPERATION_TIME not in", values, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeBetween(Date value1, Date value2) {
            addCriterion("ACTION_OPERATION_TIME between", value1, value2, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationTimeNotBetween(Date value1, Date value2) {
            addCriterion("ACTION_OPERATION_TIME not between", value1, value2, "actionOperationTime");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameIsNull() {
            addCriterion("ACTION_OPERATION_NAME is null");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameIsNotNull() {
            addCriterion("ACTION_OPERATION_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameEqualTo(String value) {
            addCriterion("ACTION_OPERATION_NAME =", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameNotEqualTo(String value) {
            addCriterion("ACTION_OPERATION_NAME <>", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameGreaterThan(String value) {
            addCriterion("ACTION_OPERATION_NAME >", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameGreaterThanOrEqualTo(String value) {
            addCriterion("ACTION_OPERATION_NAME >=", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameLessThan(String value) {
            addCriterion("ACTION_OPERATION_NAME <", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameLessThanOrEqualTo(String value) {
            addCriterion("ACTION_OPERATION_NAME <=", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameLike(String value) {
            addCriterion("ACTION_OPERATION_NAME like", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameNotLike(String value) {
            addCriterion("ACTION_OPERATION_NAME not like", value, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameIn(List<String> values) {
            addCriterion("ACTION_OPERATION_NAME in", values, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameNotIn(List<String> values) {
            addCriterion("ACTION_OPERATION_NAME not in", values, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameBetween(String value1, String value2) {
            addCriterion("ACTION_OPERATION_NAME between", value1, value2, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionOperationNameNotBetween(String value1, String value2) {
            addCriterion("ACTION_OPERATION_NAME not between", value1, value2, "actionOperationName");
            return (Criteria) this;
        }

        public Criteria andActionMessageIsNull() {
            addCriterion("ACTION_MESSAGE is null");
            return (Criteria) this;
        }

        public Criteria andActionMessageIsNotNull() {
            addCriterion("ACTION_MESSAGE is not null");
            return (Criteria) this;
        }

        public Criteria andActionMessageEqualTo(String value) {
            addCriterion("ACTION_MESSAGE =", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageNotEqualTo(String value) {
            addCriterion("ACTION_MESSAGE <>", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageGreaterThan(String value) {
            addCriterion("ACTION_MESSAGE >", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageGreaterThanOrEqualTo(String value) {
            addCriterion("ACTION_MESSAGE >=", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageLessThan(String value) {
            addCriterion("ACTION_MESSAGE <", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageLessThanOrEqualTo(String value) {
            addCriterion("ACTION_MESSAGE <=", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageLike(String value) {
            addCriterion("ACTION_MESSAGE like", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageNotLike(String value) {
            addCriterion("ACTION_MESSAGE not like", value, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageIn(List<String> values) {
            addCriterion("ACTION_MESSAGE in", values, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageNotIn(List<String> values) {
            addCriterion("ACTION_MESSAGE not in", values, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageBetween(String value1, String value2) {
            addCriterion("ACTION_MESSAGE between", value1, value2, "actionMessage");
            return (Criteria) this;
        }

        public Criteria andActionMessageNotBetween(String value1, String value2) {
            addCriterion("ACTION_MESSAGE not between", value1, value2, "actionMessage");
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