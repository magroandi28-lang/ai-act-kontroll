function combine(values, operator) {
  if (!values.length) return null;
  if (operator === "OR") {
    if (values.includes(true)) return true;
    return values.includes(null) ? null : false;
  }
  if (values.includes(false)) return false;
  return values.includes(null) ? null : true;
}

function compare(condition, facts) {
  const exists = Object.prototype.hasOwnProperty.call(facts, condition.fact_key);
  const actual = facts[condition.fact_key];
  const expected = condition.expected_value;

  if (!["exists", "not_exists"].includes(condition.comparison_operator) && (!exists || actual === null)) {
    return null;
  }

  switch (condition.comparison_operator) {
    case "exists": return exists && actual !== null;
    case "not_exists": return !exists || actual === null;
    case "is_true": return actual === true;
    case "is_false": return actual === false;
    case "eq": return actual === expected;
    case "neq": return actual !== expected;
    case "in": return (Array.isArray(expected) ? expected : [expected]).includes(actual);
    case "not_in": return !(Array.isArray(expected) ? expected : [expected]).includes(actual);
    case "contains": return Array.isArray(actual) ? actual.includes(expected) : String(actual).includes(String(expected));
    case "gte": return actual >= expected;
    case "lte": return actual <= expected;
    default: throw new Error(`Nem támogatott operátor: ${condition.comparison_operator}`);
  }
}

export function evaluateRule(rule, facts) {
  const missing = new Set();
  const groups = (rule.aic_rule_condition_groups || []).map((group) => {
    const values = (group.aic_rule_conditions || []).map((condition) => {
      const result = compare(condition, facts);
      if (result === null) missing.add(condition.fact_key);
      return result;
    });
    return combine(values, group.group_operator);
  });
  const result = combine(groups, rule.condition_groups_operator);
  return {
    rule_id: rule.id,
    evaluation_status: result === true ? "matched" : result === false ? "not_matched" : "insufficient_data",
    missing_facts: [...missing].sort(),
  };
}
