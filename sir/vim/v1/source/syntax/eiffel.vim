" Eiffel syntax file
" Language:	Eiffel
" Maintainer:	Reimer Behrends <reimer.behrends@usa.net>
"               With much input from Jocelyn Fiat <fiat@eiffel.com>
" Last change:	1998 March 26

" Remove any old syntax stuff hanging around

syn clear

" Option handling

if exists("eiffel_ignore_case")
  syn case ignore
else
  syn case match
  if exists("eiffel_pedantic")
    syn keyword eiffelError          current void result precursor none
    syn keyword eiffelError          CURRENT VOID RESULT PRECURSOR None
  endif
  if exists("eiffel_lower_case_predef")
    syn keyword eiffelPredefined     current void result precursor
  endif
endif

if exists("eiffel_hex_constants")
  syn match  eiffelNumber          "[0-9][0-9a-fA-F]*[xX]"
endif

" Keyword definitions

syn keyword eiffelTopStruct      indexing class feature creation inherit
syn match   eiffelKeyword	 "\<end\>"
syn match   eiffelTopStruct      "^end\>\(\s*--\s\+class\s\+\<[A-Z][A-Z0-9_]*\>\)\=" contains=eiffelClassName
syn keyword eiffelDeclaration    is do once deferred unique local
syn keyword eiffelDeclaration    Unique
syn keyword eiffelProperty       expanded obsolete separate frozen
syn keyword eiffelProperty       prefix infix
syn keyword eiffelInheritClause  rename redefine undefine select export as
syn keyword eiffelAll            all
syn keyword eiffelKeyword        external alias
syn keyword eiffelStatement      if else elseif inspect
syn keyword eiffelStatement      when then 
syn match   eiffelAssertion      "\<require\(\s\+else\)\=\>"
syn match   eiffelAssertion      "\<ensure\(\s\+then\)\=\>"
syn keyword eiffelAssertion      check
syn keyword eiffelDebug          debug
syn keyword eiffelStatement      from until loop
syn keyword eiffelAssertion      variant
syn match   eiffelAssertion      "\<invariant\>"
syn match   eiffelTopStruct      "^invariant\>"
syn keyword eiffelException      rescue retry

syn keyword eiffelPredefined     Current Void Result Precursor

" Operators
syn match   eiffelOperator       "\<and\(\s\+then\)\=\>"
syn match   eiffelOperator       "\<or\(\s\+else\)\=\>"
syn keyword eiffelOperator       xor implies not
syn keyword eiffelOperator       strip old
syn keyword eiffelOperator	 Strip
syn match   eiffelOperator       "\$"
syn match   eiffelBrackets       "[[\]]"
syn match   eiffelCreation       "!"
syn match   eiffelExport         "[{}]"
syn match   eiffelArray          "<<"
syn match   eiffelArray          ">>"
syn match   eiffelConstraint     "->"
syn match   eiffelOperator       "[@#|&][^ \e\t\b%]*"

" Special classes
syn keyword eiffelAnchored	 like
syn keyword eiffelBitType        BIT

" Constants
syn keyword eiffelBool           true false
syn keyword eiffelBool		 True False
syn region  eiffelString         start=+"+ skip=+%"+ end=+"+ contains=eiffelEscape,eiffelStringError
syn match   eiffelEscape 	 contained "%[^/]"
syn match   eiffelEscape 	 contained "%/[0-9]\+/"
syn match   eiffelEscape 	 contained "^[ \t]*%"
syn match   eiffelEscape 	 contained "%[ \t]*$"
syn match   eiffelStringError    contained "%/[^0-9]"
syn match   eiffelStringError    contained "%/[0-9]\+[^0-9/]"
syn match   eiffelBadConstant    "'\(%[^/]\|%/[0-9]\+/\|[^'%]\)\+'"
syn match   eiffelBadConstant    "''"
syn match   eiffelCharacter      "'\(%[^/]\|%/[0-9]\+/\|[^'%]\)'" contains=eiffelEscape
syn match   eiffelNumber         "-\=\<[0-9]\+\(_[0-9]\+\)*\>"
syn match   eiffelNumber         "\<[01]\+[bB]\>"
syn match   eiffelNumber         "-\=\<[0-9]\+\(_[0-9]\+\)*\.\([0-9]\+\(_[0-9]\+\)*\)\=\([eE][-+]\=[0-9]\+\(_[0-9]\+\)*\)\="
syn match   eiffelNumber         "-\=\.[0-9]\+\(_[0-9]\+\)*\([eE][-+]\=[0-9]\+\(_[0-9]\+\)*\)\="
syn match   eiffelComment        "--.*" contains=eiffelTodo

syn case match

" Case sensitive stuff

syn keyword eiffelTodo           contained TODO XXX FIXME
syn match   eiffelClassName      "\<[A-Z][A-Z0-9_]*\>"

" Catch mismatched parentheses
syn match eiffelParenError       ")"
syn match eiffelBracketError     "\]"
syn region eiffelGeneric         transparent matchgroup=eiffelBrackets start="\[" end="\]" contains=ALLBUT,eiffelBracketError
syn region eiffelParen           transparent start="(" end=")" contains=ALLBUT,eiffelParenError

" Should suffice for even very long strings and expressions
syn sync lines=40

if !exists("did_eiffel_syntax_inits")
  let did_eiffel_syntax_inits = 1
  " The default methods for hilighting.  Can be overridden later
  hi link eiffelKeyword		Statement
  hi link eiffelProperty	Statement
  hi link eiffelInheritClause	Statement
  hi link eiffelStatement	Statement
  hi link eiffelDeclaration	Statement
  hi link eiffelAssertion	Statement
  hi link eiffelDebug		Statement
  hi link eiffelException	Statement

  hi link eiffelTopStruct	PreProc

  hi link eiffelAll		Special
  hi link eiffelAnchored	Special
  hi link eiffelBitType		Special

  hi link eiffelEscape 		Special

  hi link eiffelBool	 	Boolean
  hi link eiffelString 		String
  hi link eiffelCharacter	Character
  hi link eiffelClassName 	Type
  hi link eiffelNumber 		Number

  hi link eiffelOperator	Special
  hi link eiffelArray		Special
  hi link eiffelExport		Special
  hi link eiffelCreation	Special
  hi link eiffelBrackets	Special
  hi link eiffelConstraint	Special

  hi link eiffelPredefined	Constant

  hi link eiffelComment		Comment

  hi link eiffelError		Error
  hi link eiffelBadConstant	Error
  hi link eiffelStringError	Error
  hi link eiffelParenError	Error
  hi link eiffelBracketError	Error

  hi link eiffelTodo		Todo
endif

let b:current_syntax = "eiffel"

" vim: ts=8