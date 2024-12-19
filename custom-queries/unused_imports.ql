/**
 * @name Unused Imports
 * @description Detects unused import statements in JavaScript/TypeScript files.
 * @kind problem
 * @problem.severity warning
 * @tags maintainability, readability, code-smell
 * @id js/unused-imports
 */

import javascript

/**
 * Matches import declarations.
 */
class UnusedImport extends Import {
  predicate isUnused() {
    // An import is unused if none of its imported identifiers are referenced.
    result = not exists(this.getAnImportedValue().getALocalUse())
  }
}

from UnusedImport unusedImport
where unusedImport.isUnused()
select unusedImport, "Remove this unused import."
