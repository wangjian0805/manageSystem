package com.tasly.deepureflow.domain.system;

import java.util.ArrayList;
import java.util.List;

public class HierarchyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public HierarchyExample() {
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

        public Criteria andHierarchyIdIsNull() {
            addCriterion("HIERARCHY_ID is null");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdIsNotNull() {
            addCriterion("HIERARCHY_ID is not null");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdEqualTo(Integer value) {
            addCriterion("HIERARCHY_ID =", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdNotEqualTo(Integer value) {
            addCriterion("HIERARCHY_ID <>", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdGreaterThan(Integer value) {
            addCriterion("HIERARCHY_ID >", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("HIERARCHY_ID >=", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdLessThan(Integer value) {
            addCriterion("HIERARCHY_ID <", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdLessThanOrEqualTo(Integer value) {
            addCriterion("HIERARCHY_ID <=", value, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdIn(List<Integer> values) {
            addCriterion("HIERARCHY_ID in", values, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdNotIn(List<Integer> values) {
            addCriterion("HIERARCHY_ID not in", values, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdBetween(Integer value1, Integer value2) {
            addCriterion("HIERARCHY_ID between", value1, value2, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyIdNotBetween(Integer value1, Integer value2) {
            addCriterion("HIERARCHY_ID not between", value1, value2, "hierarchyId");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameIsNull() {
            addCriterion("HIERARCHY_NAME is null");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameIsNotNull() {
            addCriterion("HIERARCHY_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameEqualTo(String value) {
            addCriterion("HIERARCHY_NAME =", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameNotEqualTo(String value) {
            addCriterion("HIERARCHY_NAME <>", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameGreaterThan(String value) {
            addCriterion("HIERARCHY_NAME >", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameGreaterThanOrEqualTo(String value) {
            addCriterion("HIERARCHY_NAME >=", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameLessThan(String value) {
            addCriterion("HIERARCHY_NAME <", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameLessThanOrEqualTo(String value) {
            addCriterion("HIERARCHY_NAME <=", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameLike(String value) {
            addCriterion("HIERARCHY_NAME like", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameNotLike(String value) {
            addCriterion("HIERARCHY_NAME not like", value, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameIn(List<String> values) {
            addCriterion("HIERARCHY_NAME in", values, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameNotIn(List<String> values) {
            addCriterion("HIERARCHY_NAME not in", values, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameBetween(String value1, String value2) {
            addCriterion("HIERARCHY_NAME between", value1, value2, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNameNotBetween(String value1, String value2) {
            addCriterion("HIERARCHY_NAME not between", value1, value2, "hierarchyName");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickIsNull() {
            addCriterion("HIERARCHY_NICK is null");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickIsNotNull() {
            addCriterion("HIERARCHY_NICK is not null");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickEqualTo(String value) {
            addCriterion("HIERARCHY_NICK =", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickNotEqualTo(String value) {
            addCriterion("HIERARCHY_NICK <>", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickGreaterThan(String value) {
            addCriterion("HIERARCHY_NICK >", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickGreaterThanOrEqualTo(String value) {
            addCriterion("HIERARCHY_NICK >=", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickLessThan(String value) {
            addCriterion("HIERARCHY_NICK <", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickLessThanOrEqualTo(String value) {
            addCriterion("HIERARCHY_NICK <=", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickLike(String value) {
            addCriterion("HIERARCHY_NICK like", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickNotLike(String value) {
            addCriterion("HIERARCHY_NICK not like", value, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickIn(List<String> values) {
            addCriterion("HIERARCHY_NICK in", values, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickNotIn(List<String> values) {
            addCriterion("HIERARCHY_NICK not in", values, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickBetween(String value1, String value2) {
            addCriterion("HIERARCHY_NICK between", value1, value2, "hierarchyNick");
            return (Criteria) this;
        }

        public Criteria andHierarchyNickNotBetween(String value1, String value2) {
            addCriterion("HIERARCHY_NICK not between", value1, value2, "hierarchyNick");
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