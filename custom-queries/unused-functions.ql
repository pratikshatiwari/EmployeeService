import javascript

/**
 * @name Unused Functions
 * @description Identifies functions that are defined but never called in the code.
 * @kind problem
 * @problem.severity warning
 */

from Function f
where
  // Ensure the function is not an anonymous function
  //not f.getName() = "undefined" and
  not f.isExported() and not f.isMethod()
  // Check if the function is not called
  not exists(CallExpr call | call.getCallee() = f)
select f, "This function is defined but never called."
