/**
 * @name Detect Complex Code Patterns
 * @description Identifies unsafe use of `eval` and nested structures.
 * @kind problem
 * @problem.severity warning
 * @id complex-java
 */

import javascript

from CallExpr call, string methodName
where call.getCallee().getName() = "eval" // Detect `eval` usage
  or exists (LoopStmt loop | loop.getEnclosingLoop().getEnclosingLoop() = loop) // Nested loops
select call, "Unsafe use of '" + methodName + "' detected in complex code."
