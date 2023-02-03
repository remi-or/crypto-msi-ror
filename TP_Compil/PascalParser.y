-- Import stuff
{
module PascalParser(parseProgram,ParseResult,initEtat)
where
import Control.Monad.State.Lazy
import PascaLex
}


-- Happy context
%name parse
%tokentype { Token }
%error { parseError }
%monad { ParseResult }


-- Tokens
%token
  -- Special characters
  sep         {TK_SEP _}
  '('         {TK_OPP _}
  ')'         {TK_CLP _}
  '{'         {TK_OPCB _}
  '}'         {TK_CLCB _}
  '['         {TK_OPBR _}
  ']'         {TK_CLBR _}
  -- Branches
  if          {TK_IF _}
  then        {TK_THEN _}
  else        {TK_ELSE _}
  -- Loops
  while       {TK_WHILE _}
  -- Native functions
  print       {TK_PRINT _}
  input       {TK_INPUT _}
  return       {TK_RETURN _}
  -- Functions
  def         {TK_DEF _}
  -- Booleans
  true        {TK_TRUE _}
  false       {TK_FALSE _}
  -- Variables
  declaration {TK_DECLARATION _}
  variable    {TK_VAR _ $$}
  -- Integers
  integer     {TK_INT _ $$}
  -- Operands
  '+'         {TK_ADD  _}
  '-'         {TK_SUB  _}
  '*'         {TK_MUL  _}
  '/'         {TK_DIV  _}
  '='         {TK_EQ   _}
  '%'         {TK_MOD  _}
  -- Comparaison
  '<'         {TK_INFS _}
  '<='        {TK_INFE _}
  '>'         {TK_SUPS _}
  '>='        {TK_SUPE _}
  '=='        {TK_ISEQ _}
  '!='        {TK_ISDF _}


-- Details for operands
%left '+' '-'
%left '%'
%left '*' '/'
   

-- Grammar
%%
Asm : Linst {$1 ++ "\tSTOP\n"}

Linst : Inst {$1}
      | Linst Inst {$1 ++ $2}

Inst : NativeFn sep {$1}
     | Variable sep {$1}
     | Branch {$1}
     | While {$1}
     | Function {$1}
     | sep { "" }

NativeFn : print Expr {$2 ++ "\tOUT\n"}
         | return Expr {$2 ++"\tSWAP\n"}
         | input variable {"\tPUSH\t" ++ $2 ++ "\n\tIN\n\tSTORE\n"}

Variable : declaration variable '[' integer ']' '=' Expr {declareTable $2 $4 0 $7}
         | declaration variable '[' integer ']' {declareTable $2 $4 0 "\tPUSH\t0\n"}
         | declaration variable '=' Expr {$2 ++ "\tDS\t1\n\tPUSH\t" ++ $2 ++ "\n" ++ $4 ++ "\tSTORE\n"}
         | declaration variable {$2 ++ "\tDS\t1\n"}
         | variable '=' Expr {"\tPUSH\t" ++ $1 ++ "\n" ++ $3 ++ "\tSTORE\n"}
         | variable '[' integer ']' '=' Expr {"\tPUSH\t" ++ $1 ++ "__" ++ (show $3) ++ "\n" ++ $6 ++ "\tSTORE\n"}

Branch : if Expr then '{' Linst '}' else '{' Linst '}' {% mkBranch $2 $5 $9}
       | if Expr then '{' Linst '}' {% mkBranch $2 $5 ""}
       | if Expr then Inst else Inst {% mkBranch $2 $4 $6}
       | if Expr then Inst {% mkBranch $2 $4 ""}

While : while Expr '{' Linst '}' {% mkWhile $2 $4}

Function : FunctionDefinition {$1}
         | FunctionCall sep {$1}
FunctionDefinition : def variable '{' Linst '}' {"\tPUSH\t_eof_" ++ $2 ++ "\n\tGOTO\n_sof_" ++ $2 ++ "\tEQU\t*\n" ++ $4 ++ "\tGOTO\n_eof_"++$2++"\tEQU\t*\n"}
FunctionCall : variable '(' ')' {% mkFnCall $1}

Expr : Atom {$1}
     | Test {$1}
     | ArithmExpr {$1}
     | '(' Expr ')' {$2}

ArithmExpr : Expr '+' Expr {$1 ++ $3 ++ "\tADD\n"}
           | Expr '-' Expr {$1 ++ $3 ++ "\tSUB\n"}
           | Expr '*' Expr {$1 ++ $3 ++ "\tMUL\n"}
           | Expr '/' Expr {$1 ++ $3 ++ "\tDIV\n"}
           | Expr '%' Expr {$1 ++ $3 ++ $1 ++ $3 ++ "\tDIV\n\tMUL\n\tSUB\n"}
           | '-' Expr {"\tPUSH\t0\n" ++ $2 ++ "\tSUB\n"}

Atom : integer {"\tPUSH\t" ++ (show $1) ++ "\n"}
     | variable '[' integer ']' {"\tPUSH\t" ++ $1 ++ "__" ++ (show $3) ++ "\n\tLOAD\n"}
     | variable {"\tPUSH\t" ++ $1 ++ "\n\tLOAD\n"}
     | true {"\tPUSH\t1\n"}
     | false {"\tPUSH\t0\n"}
     | FunctionCall {$1}

Test : Expr '<' Expr {% mkInfsTest $1 $3}
     | Expr '>' Expr {% mkInfsTest ("\tPUSH\t0\n" ++ $1 ++ "\tSUB\n") ("\tPUSH\t0\n" ++ $3 ++ "\tSUB\n")}
     | Expr '<=' Expr {% mkInfsTest ($1 ++ "\tPUSH\t1\n\tSUB\n") $3}
     | Expr '>=' Expr {% mkInfsTest ("\tPUSH\t0\n" ++ $1 ++ "\tSUB\n\tPUSH\t1\n\tSUB\n") ("\tPUSH\t0\n" ++ $3 ++ "\tSUB\n")}
     | Expr '==' Expr {% mkEqTest $1 $3}
     | Expr '!=' Expr {% mkDfTest $1 $3}

{
data Etat = Etat {counter :: Integer} deriving (Eq, Show)
type ParseResult a = State Etat a

incrCounter :: Etat -> Etat
incrCounter s = Etat {counter = (counter s) + 1}

initEtat :: Etat
initEtat = Etat 0

mkBranch :: String -> String -> String -> ParseResult String
mkBranch test if_nonzero if_zero =  do
  s <- get
  let branch_id = show (counter s)
      s' = incrCounter s
  put s'
  return (   test 
          ++ "\tBEZ if0_"++branch_id++"\n" 
          ++ if_nonzero
          ++ "\tPUSH if1_"++branch_id++"\n"
          ++ "\tGOTO\n"
          ++ "if0_"++branch_id++"\tEQU\t*\n"
          ++ if_zero
          ++ "if1_"++branch_id++"\tEQU\t*\n" )

mkWhile :: String -> String -> ParseResult String
mkWhile test body =  do
  s <- get
  let while_id = show (counter s)
      s' = incrCounter s
  put s'
  return ("while_check_"++while_id++"\tEQU\t*\n"
       ++ test 
       ++ "\tBEZ eol_"++while_id++"\n" 
       ++ body
       ++ "\tPUSH while_check_"++while_id++"\n"
       ++ "\tGOTO\n"
       ++ "eol_"++while_id++"\tEQU\t*\n")

mkInfsTest :: String -> String -> ParseResult String
mkInfsTest a b =  do
  s <- get
  let test_id = show (counter s)
      s' = incrCounter s
  put s'
  return  (b
        ++ a 
        ++ "\tSUB\n"
        ++ "\tBGZ is_infs_"++test_id++"\n" 
        ++ "\tPUSH\t0\n"
        ++ "\tPUSH\tisnt_infs_"++test_id++"\n"
        ++ "\tGOTO\n"
        ++ "is_infs_"++test_id++"\tEQU\t*\n"
        ++ "\tPUSH\t1\n"
        ++ "isnt_infs_"++test_id++"\tEQU\t*\n")

mkEqTest :: String -> String -> ParseResult String
mkEqTest a b =  do
  s <- get
  let test_id = show (counter s)
      s' = incrCounter s
  put s'
  return (b
       ++ a 
       ++ "\tSUB\n"
       ++ "\tBEZ is_eq_"++test_id++"\n" 
       ++ "\tPUSH\t0\n"
       ++ "\tPUSH\tisnt_eq_"++test_id++"\n"
       ++ "\tGOTO\n"
       ++ "is_eq_"++test_id++"\tEQU\t*\n"
       ++ "\tPUSH\t1\n"
       ++ "isnt_eq_"++test_id++"\tEQU\t*\n")

mkDfTest :: String -> String -> ParseResult String
mkDfTest a b =  do
  s <- get
  let test_id = show (counter s)
      s' = incrCounter s
  put s'
  return (   b
          ++ a 
          ++ "\tSUB\n"
          ++ "\tBEZ isnt_df_"++test_id++"\n" 
          ++ "\tPUSH\t1\n"
          ++ "\tPUSH\tis_df_"++test_id++"\n"
          ++ "\tGOTO\n"
          ++ "isnt_df_"++test_id++"\tEQU\t*\n"
          ++ "\tPUSH\t0\n"
          ++ "is_df_"++test_id++"\tEQU\t*\n")

mkFnCall :: String -> ParseResult String
mkFnCall functionName =  do
  s <- get
  let call_id = show (counter s)
      s' = incrCounter s
  put s'
  return ("\tPUSH\treturn_"++call_id++"\n"
       ++ "\tPUSH\t_sof_"++functionName++"\n"
       ++ "\tGOTO\n"
       ++ "return_"++call_id++"\tEQU\t*\n")

declareTable :: String -> Int -> Int -> String -> String
declareTable name 0    current initVal = ""
declareTable name size current initVal = (name++"__"++(show current)++"\tDS\t1\n"
                                       ++ "\tPUSH\t"++name++"__"++(show current)++"\n"
                                       ++ initVal
                                       ++ "\tSTORE\n"
                                       ++ (declareTable name (size-1) (current+1) initVal))

parseProgram :: String -> ParseResult String
parseProgram = parse . scanTokens

parseError :: [Token] -> a
parseError [] = error "Parse error at the end of input"
parseError (h:_) = let p = getAPosn h in error $ "Parse error at line " ++ getALine p ++ ", column " ++ getACol p ++ ", on token " ++ show h
}