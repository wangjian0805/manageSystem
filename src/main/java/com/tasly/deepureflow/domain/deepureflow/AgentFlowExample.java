package com.tasly.deepureflow.domain.deepureflow;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AgentFlowExample {

	protected String orderByClause;

	protected boolean distinct;

	protected List<Criteria> oredCriteria;

	public AgentFlowExample() {
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

		public Criteria andAgentFlowDateIsNull() {
			addCriterion("AGENT_FLOW_DATE is null");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateIsNotNull() {
			addCriterion("AGENT_FLOW_DATE is not null");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateEqualTo(Date value) {
			addCriterion("AGENT_FLOW_DATE =", value, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateNotEqualTo(Date value) {
			addCriterion("AGENT_FLOW_DATE <>", value, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateGreaterThan(Date value) {
			addCriterion("AGENT_FLOW_DATE >", value, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateGreaterThanOrEqualTo(Date value) {
			addCriterion("AGENT_FLOW_DATE >=", value, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateLessThan(Date value) {
			addCriterion("AGENT_FLOW_DATE <", value, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateLessThanOrEqualTo(Date value) {
			addCriterion("AGENT_FLOW_DATE <=", value, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateIn(List<Date> values) {
			addCriterion("AGENT_FLOW_DATE in", values, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateNotIn(List<Date> values) {
			addCriterion("AGENT_FLOW_DATE not in", values, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateBetween(Date value1, Date value2) {
			addCriterion("AGENT_FLOW_DATE between", value1, value2, "agentFlowDate");
			return (Criteria) this;
		}

		public Criteria andAgentFlowDateNotBetween(Date value1, Date value2) {
			addCriterion("AGENT_FLOW_DATE not between", value1, value2, "agentFlowDate");
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

		public Criteria andAgentFlowStatusIsNull() {
			addCriterion("AGENT_FLOW_STATUS is null");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusIsNotNull() {
			addCriterion("AGENT_FLOW_STATUS is not null");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusEqualTo(Byte value) {
			addCriterion("AGENT_FLOW_STATUS =", value, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusNotEqualTo(Byte value) {
			addCriterion("AGENT_FLOW_STATUS <>", value, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusGreaterThan(Byte value) {
			addCriterion("AGENT_FLOW_STATUS >", value, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusGreaterThanOrEqualTo(Byte value) {
			addCriterion("AGENT_FLOW_STATUS >=", value, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusLessThan(Byte value) {
			addCriterion("AGENT_FLOW_STATUS <", value, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusLessThanOrEqualTo(Byte value) {
			addCriterion("AGENT_FLOW_STATUS <=", value, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusIn(List<Byte> values) {
			addCriterion("AGENT_FLOW_STATUS in", values, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusNotIn(List<Byte> values) {
			addCriterion("AGENT_FLOW_STATUS not in", values, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusBetween(Byte value1, Byte value2) {
			addCriterion("AGENT_FLOW_STATUS between", value1, value2, "agentFlowStatus");
			return (Criteria) this;
		}

		public Criteria andAgentFlowStatusNotBetween(Byte value1, Byte value2) {
			addCriterion("AGENT_FLOW_STATUS not between", value1, value2, "agentFlowStatus");
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