/**
 * @name Unsafe Evaluation Functions
 * @description Detects usage of `eval`, `setTimeout`, and `setInterval` with string arguments.
 * @kind problem
 * @problem.severity error
 * @id js/unsafe-eval
 * @tags security
 */

import javascript
import semmle.javascript.security.dataflow.PrototypePollutingAssignmentQuery
import DataFlow::PathGraph
import semmle.javascript.heuristics.AdditionalSources

from Configuration cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink) and source.getNode() instanceof HeuristicSource
select sink, source, sink,
  "This assignment may alter Object.prototype if a malicious '__proto__' string is injected from $@.",
  source.getNode(), source.getNode().(Source).describe()
