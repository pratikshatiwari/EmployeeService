import java
import semmle.code.java.metrics.CyclomaticComplexity

/**
 * @name Complex method detection
 * @description Detects methods with high cyclomatic complexity.
 * @kind problem
 * @id java-reliability-complex-method
 * @severity warning
 */
from Method m, int complexity
where complexity = m.getCyclomaticComplexity() and complexity > 10
select m, "Method '" + m.getName() + "' has cyclomatic complexity of " + complexity + ". Refactor to improve reliability."
