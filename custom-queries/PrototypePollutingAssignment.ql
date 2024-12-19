/**
 * @name Prototype-polluting assignment with additional heuristic sources
 * @description Modifying an object obtained via a user-controlled property name may
 *              lead to accidental mutation of the built-in Object prototype,
 *              and possibly escalate to remote code execution or cross-site scripting.
 * @kind problem
 * @problem.severity error
 * @id js/prototype-polluting-assignment-more-sources
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
