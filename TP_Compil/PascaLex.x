{
module PascaLex (Token(..),AlexPosn(..),getAPosn,getALine,getACol,scanTokens) where
}

%wrapper "posn"

tokens :-
  -- Special characters
  <0> $white+ ;
  <0> \;          {\p _ -> TK_SEP p}
  <0> \(          {\p _ -> TK_OPP p}
  <0> \)          {\p _ -> TK_CLP p}
  <0> \#[a-zA-Z0-9\ \;]*\n ;
  <0> \{          {\p _ -> TK_OPCB p}
  <0> \}          {\p _ -> TK_CLCB p}
  <0> \[          {\p _ -> TK_OPBR p}
  <0> \]          {\p _ -> TK_CLBR p}
  -- Branches
  <0> if          {\p _ -> TK_IF p}
  <0> then        {\p _ -> TK_THEN p}
  <0> else        {\p _ -> TK_ELSE p}
  -- Loops
  <0> while       {\p _ -> TK_WHILE p}
  -- Native functions
  <0> print       {\p _ -> TK_PRINT p}
  <0> input       {\p _ -> TK_INPUT p}
  <0> return       {\p _ -> TK_RETURN p}
  -- Functions
  <0> def         {\p _ -> TK_DEF p}
  -- Booleans
  <0> True        {\p _ -> TK_TRUE p}
  <0> False       {\p _ -> TK_FALSE p}
  -- Variables
  <0> var             {\p _ -> TK_DECLARATION p}
  <0> [a-z]+          {\p n -> TK_VAR p n}
  -- Integers
  <0> [1-9][0-9]* {\p s -> TK_INT p (read s)}
  <0> 0           {\p _ -> TK_INT p 0}
  -- Operands
  <0> \+          {\p _ -> TK_ADD  p}
  <0> \-          {\p _ -> TK_SUB  p}
  <0> \*          {\p _ -> TK_MUL  p}
  <0> \/          {\p _ -> TK_DIV  p}
  <0> \=          {\p _ -> TK_EQ   p}
  <0> \%          {\p _ -> TK_MOD  p}
  -- Comparaison
  <0> \<          {\p _ -> TK_INFS p}
  <0> \<\=        {\p _ -> TK_INFE p}
  <0> \>          {\p _ -> TK_SUPS p}
  <0> \>\=        {\p _ -> TK_SUPE p}
  <0> \=\=        {\p _ -> TK_ISEQ p}
  <0> \!\=        {\p _ -> TK_ISDF p}

{

data Token
  -- Special characters
  = TK_SEP AlexPosn
  | TK_OPP AlexPosn
  | TK_CLP AlexPosn
  | TK_OPCB AlexPosn
  | TK_CLCB AlexPosn
  | TK_OPBR AlexPosn
  | TK_CLBR AlexPosn
  -- Branches 
  | TK_IF AlexPosn
  | TK_THEN AlexPosn
  | TK_ELSE AlexPosn
  -- Loops
  | TK_WHILE AlexPosn
  -- Native functions
  | TK_PRINT AlexPosn
  | TK_INPUT AlexPosn
  | TK_RETURN AlexPosn
  -- Functions
  | TK_DEF AlexPosn
  -- Booleans
  | TK_TRUE AlexPosn
  | TK_FALSE AlexPosn
  -- Variables
  | TK_DECLARATION AlexPosn
  | TK_VAR AlexPosn String
  -- Integers
  | TK_INT AlexPosn Int
  -- Operands
  | TK_ADD  AlexPosn
  | TK_SUB  AlexPosn
  | TK_MUL  AlexPosn
  | TK_DIV  AlexPosn
  | TK_EQ   AlexPosn
  | TK_MOD  AlexPosn
  -- Comparaison
  | TK_INFS AlexPosn
  | TK_INFE AlexPosn
  | TK_SUPS AlexPosn
  | TK_SUPE AlexPosn
  | TK_ISEQ AlexPosn
  | TK_ISDF AlexPosn
  deriving (Eq,Show)

scanTokens = alexScanTokens

getAPosn :: Token -> AlexPosn
  -- Special characters
getAPosn (TK_SEP p) = p
getAPosn (TK_OPP p) = p
getAPosn (TK_CLP p) = p
getAPosn (TK_OPCB p) = p
getAPosn (TK_CLCB p) = p
getAPosn (TK_OPBR p) = p
getAPosn (TK_CLBR p) = p
-- Branches 
getAPosn (TK_IF p) = p
getAPosn (TK_THEN p) = p
getAPosn (TK_ELSE p) = p
  -- Loops
getAPosn (TK_WHILE p) = p
  -- Native functions
getAPosn (TK_PRINT p) = p
getAPosn (TK_INPUT p) = p
getAPosn (TK_RETURN p) = p
  -- Functions
getAPosn (TK_DEF p) = p
  -- Booleans
getAPosn (TK_TRUE p) = p
getAPosn (TK_FALSE p) = p
  -- Variables
getAPosn (TK_DECLARATION p) = p
getAPosn (TK_VAR p _) = p
  -- Integers
getAPosn (TK_INT p _) = p
  -- Operands
getAPosn (TK_ADD  p) = p
getAPosn (TK_SUB  p) = p
getAPosn (TK_MUL  p) = p
getAPosn (TK_DIV  p) = p
getAPosn (TK_EQ   p) = p
getAPosn (TK_MOD  p) = p
  -- Comparaison
getAPosn (TK_INFS p) = p
getAPosn (TK_INFE p) = p
getAPosn (TK_SUPS p) = p
getAPosn (TK_SUPE p) = p
getAPosn (TK_ISEQ p) = p
getAPosn (TK_ISDF p) = p
getAPosn _ = error "Unimplemented yet"

getALine :: AlexPosn -> String
getALine (AlexPn _ l _) = show l

getACol :: AlexPosn -> String
getACol (AlexPn _ _ c) = show c
}
