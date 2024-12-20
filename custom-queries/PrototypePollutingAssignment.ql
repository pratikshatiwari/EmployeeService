/**
 * @name Prototype Pollution Risk Detection in Java
 * @description Identifies potential prototype pollution-like vulnerabilities in Java applications.
 * @kind path-problem
 * @problem.severity warning
 * @id java-prototype-pollution-risk
 * @tags security
 */

import java
import semmle.code.java.dataflow.DataFlow

/**
 * Configuration to track the flow of untrusted data into dynamic object manipulations.
 */
class PrototypePollutionRisk extends TaintTracking::Configuration {
  PrototypePollutionRisk() {
    this = "PrototypePollutionRisk"
  }

  override predicate isSource(DataFlow::Node source) {
    exists(MethodCall mc |
      mc.getMethod().getDeclaringType().hasQualifiedName("java.util", "Map") and
      mc.getMethod().getName() = "put" and
      source.asExpr() = mc.getArgument(0)
    )
  }

  override predicate isSink(DataFlow::Node sink) {
    exists(MethodCall mc |
      mc.getMethod().getDeclaringType().hasQualifiedName("java.util", "Map") and
      mc.getMethod().getName() = "get" and
      sink.asExpr() = mc.getArgument(0)
    )
  }
}

/**
 * Main query to identify risky data flows.
 */
from PrototypePollutionRisk config, DataFlow::PathNode flow
where config.hasFlowPath(flow)
select flow, 
  "Potential untrusted data flow into object manipulation, which may lead to prototype pollution risks."
