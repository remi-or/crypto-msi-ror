{-# OPTIONS_GHC -w #-}
module PascalParser(parseProgram,ParseResult,initEtat)
where
import Control.Monad.State.Lazy
import PascaLex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,401) ([0,63746,12,0,58376,51,0,36896,207,0,0,0,0,512,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,1024,23296,0,4096,27648,1,16384,45056,5,0,0,2,0,4,91,0,0,32,0,0,128,0,4352,32768,0,0,0,0,8192,0,0,0,0,1,0,49153,22,0,64,512,0,64,0,0,0,0,0,0,30720,127,0,0,0,0,0,0,0,0,0,0,49153,22,0,0,0,0,0,0,0,1088,0,0,0,0,0,1024,23296,0,0,0,0,0,0,8158,0,4,32632,0,512,64992,1,0,0,0,0,0,0,0,0,0,0,0,0,18432,13284,0,16384,45056,5,0,49153,22,0,4,91,0,16,364,0,64,1456,0,256,5824,0,1024,23296,0,4096,27648,1,16384,45056,5,0,49153,22,0,4,91,0,58376,51,0,0,22528,0,0,1024,0,2048,57344,509,2048,13284,0,0,0,1,0,49153,22,0,0,64992,1,512,0,0,0,0,0,0,32768,0,0,57344,509,0,2,0,8192,53138,0,0,0,0,0,128,0,0,58504,51,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,384,0,0,0,0,0,0,0,0,24576,1,0,32768,5,0,0,0,8192,53136,0,32768,15944,3,0,63746,12,0,0,0,0,0,0,0,0,0,0,0,0,2,4096,27648,1,0,0,8158,0,49153,22,0,0,0,0,0,0,0,256,0,0,0,30720,127,512,3321,0,34816,13284,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Asm","Linst","Inst","NativeFn","Variable","Branch","While","Function","FunctionDefinition","FunctionCall","Expr","ArithmExpr","Atom","Test","sep","'('","')'","'{'","'}'","'['","']'","if","then","else","while","print","input","return","def","true","false","declaration","variable","integer","'+'","'-'","'*'","'/'","'='","'%'","'<'","'<='","'>'","'>='","'=='","'!='","%eof"]
        bit_start = st Prelude.* 50
        bit_end = (st Prelude.+ 1) Prelude.* 50
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..49]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (18) = happyShift action_11
action_0 (25) = happyShift action_12
action_0 (28) = happyShift action_13
action_0 (29) = happyShift action_14
action_0 (30) = happyShift action_15
action_0 (31) = happyShift action_16
action_0 (32) = happyShift action_17
action_0 (35) = happyShift action_18
action_0 (36) = happyShift action_19
action_0 (4) = happyGoto action_20
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (9) = happyGoto action_6
action_0 (10) = happyGoto action_7
action_0 (11) = happyGoto action_8
action_0 (12) = happyGoto action_9
action_0 (13) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (18) = happyShift action_11
action_1 (25) = happyShift action_12
action_1 (28) = happyShift action_13
action_1 (29) = happyShift action_14
action_1 (30) = happyShift action_15
action_1 (31) = happyShift action_16
action_1 (32) = happyShift action_17
action_1 (35) = happyShift action_18
action_1 (36) = happyShift action_19
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (9) = happyGoto action_6
action_1 (10) = happyGoto action_7
action_1 (11) = happyGoto action_8
action_1 (12) = happyGoto action_9
action_1 (13) = happyGoto action_10
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (18) = happyShift action_11
action_2 (25) = happyShift action_12
action_2 (28) = happyShift action_13
action_2 (29) = happyShift action_14
action_2 (30) = happyShift action_15
action_2 (31) = happyShift action_16
action_2 (32) = happyShift action_17
action_2 (35) = happyShift action_18
action_2 (36) = happyShift action_19
action_2 (6) = happyGoto action_44
action_2 (7) = happyGoto action_4
action_2 (8) = happyGoto action_5
action_2 (9) = happyGoto action_6
action_2 (10) = happyGoto action_7
action_2 (11) = happyGoto action_8
action_2 (12) = happyGoto action_9
action_2 (13) = happyGoto action_10
action_2 _ = happyReduce_1

action_3 _ = happyReduce_2

action_4 (18) = happyShift action_43
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (18) = happyShift action_42
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_6

action_7 _ = happyReduce_7

action_8 _ = happyReduce_8

action_9 _ = happyReduce_24

action_10 (18) = happyShift action_41
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_9

action_12 (19) = happyShift action_31
action_12 (33) = happyShift action_32
action_12 (34) = happyShift action_33
action_12 (36) = happyShift action_34
action_12 (37) = happyShift action_35
action_12 (39) = happyShift action_36
action_12 (13) = happyGoto action_26
action_12 (14) = happyGoto action_40
action_12 (15) = happyGoto action_28
action_12 (16) = happyGoto action_29
action_12 (17) = happyGoto action_30
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (19) = happyShift action_31
action_13 (33) = happyShift action_32
action_13 (34) = happyShift action_33
action_13 (36) = happyShift action_34
action_13 (37) = happyShift action_35
action_13 (39) = happyShift action_36
action_13 (13) = happyGoto action_26
action_13 (14) = happyGoto action_39
action_13 (15) = happyGoto action_28
action_13 (16) = happyGoto action_29
action_13 (17) = happyGoto action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (19) = happyShift action_31
action_14 (33) = happyShift action_32
action_14 (34) = happyShift action_33
action_14 (36) = happyShift action_34
action_14 (37) = happyShift action_35
action_14 (39) = happyShift action_36
action_14 (13) = happyGoto action_26
action_14 (14) = happyGoto action_38
action_14 (15) = happyGoto action_28
action_14 (16) = happyGoto action_29
action_14 (17) = happyGoto action_30
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (36) = happyShift action_37
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (19) = happyShift action_31
action_16 (33) = happyShift action_32
action_16 (34) = happyShift action_33
action_16 (36) = happyShift action_34
action_16 (37) = happyShift action_35
action_16 (39) = happyShift action_36
action_16 (13) = happyGoto action_26
action_16 (14) = happyGoto action_27
action_16 (15) = happyGoto action_28
action_16 (16) = happyGoto action_29
action_16 (17) = happyGoto action_30
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (36) = happyShift action_25
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (36) = happyShift action_24
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (19) = happyShift action_21
action_19 (23) = happyShift action_22
action_19 (42) = happyShift action_23
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (50) = happyAccept
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (20) = happyShift action_66
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (37) = happyShift action_65
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (19) = happyShift action_31
action_23 (33) = happyShift action_32
action_23 (34) = happyShift action_33
action_23 (36) = happyShift action_34
action_23 (37) = happyShift action_35
action_23 (39) = happyShift action_36
action_23 (13) = happyGoto action_26
action_23 (14) = happyGoto action_64
action_23 (15) = happyGoto action_28
action_23 (16) = happyGoto action_29
action_23 (17) = happyGoto action_30
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (23) = happyShift action_62
action_24 (42) = happyShift action_63
action_24 _ = happyReduce_16

action_25 (21) = happyShift action_61
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_43

action_27 (38) = happyShift action_46
action_27 (39) = happyShift action_47
action_27 (40) = happyShift action_48
action_27 (41) = happyShift action_49
action_27 (43) = happyShift action_50
action_27 (44) = happyShift action_51
action_27 (45) = happyShift action_52
action_27 (46) = happyShift action_53
action_27 (47) = happyShift action_54
action_27 (48) = happyShift action_55
action_27 (49) = happyShift action_56
action_27 _ = happyReduce_11

action_28 _ = happyReduce_30

action_29 _ = happyReduce_28

action_30 _ = happyReduce_29

action_31 (19) = happyShift action_31
action_31 (33) = happyShift action_32
action_31 (34) = happyShift action_33
action_31 (36) = happyShift action_34
action_31 (37) = happyShift action_35
action_31 (39) = happyShift action_36
action_31 (13) = happyGoto action_26
action_31 (14) = happyGoto action_60
action_31 (15) = happyGoto action_28
action_31 (16) = happyGoto action_29
action_31 (17) = happyGoto action_30
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_41

action_33 _ = happyReduce_42

action_34 (19) = happyShift action_21
action_34 (23) = happyShift action_59
action_34 _ = happyReduce_40

action_35 _ = happyReduce_38

action_36 (19) = happyShift action_31
action_36 (33) = happyShift action_32
action_36 (34) = happyShift action_33
action_36 (36) = happyShift action_34
action_36 (37) = happyShift action_35
action_36 (39) = happyShift action_36
action_36 (13) = happyGoto action_26
action_36 (14) = happyGoto action_58
action_36 (15) = happyGoto action_28
action_36 (16) = happyGoto action_29
action_36 (17) = happyGoto action_30
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_12

action_38 (38) = happyShift action_46
action_38 (39) = happyShift action_47
action_38 (40) = happyShift action_48
action_38 (41) = happyShift action_49
action_38 (43) = happyShift action_50
action_38 (44) = happyShift action_51
action_38 (45) = happyShift action_52
action_38 (46) = happyShift action_53
action_38 (47) = happyShift action_54
action_38 (48) = happyShift action_55
action_38 (49) = happyShift action_56
action_38 _ = happyReduce_10

action_39 (21) = happyShift action_57
action_39 (38) = happyShift action_46
action_39 (39) = happyShift action_47
action_39 (40) = happyShift action_48
action_39 (41) = happyShift action_49
action_39 (43) = happyShift action_50
action_39 (44) = happyShift action_51
action_39 (45) = happyShift action_52
action_39 (46) = happyShift action_53
action_39 (47) = happyShift action_54
action_39 (48) = happyShift action_55
action_39 (49) = happyShift action_56
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (26) = happyShift action_45
action_40 (38) = happyShift action_46
action_40 (39) = happyShift action_47
action_40 (40) = happyShift action_48
action_40 (41) = happyShift action_49
action_40 (43) = happyShift action_50
action_40 (44) = happyShift action_51
action_40 (45) = happyShift action_52
action_40 (46) = happyShift action_53
action_40 (47) = happyShift action_54
action_40 (48) = happyShift action_55
action_40 (49) = happyShift action_56
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_25

action_42 _ = happyReduce_5

action_43 _ = happyReduce_4

action_44 _ = happyReduce_3

action_45 (18) = happyShift action_11
action_45 (21) = happyShift action_86
action_45 (25) = happyShift action_12
action_45 (28) = happyShift action_13
action_45 (29) = happyShift action_14
action_45 (30) = happyShift action_15
action_45 (31) = happyShift action_16
action_45 (32) = happyShift action_17
action_45 (35) = happyShift action_18
action_45 (36) = happyShift action_19
action_45 (6) = happyGoto action_85
action_45 (7) = happyGoto action_4
action_45 (8) = happyGoto action_5
action_45 (9) = happyGoto action_6
action_45 (10) = happyGoto action_7
action_45 (11) = happyGoto action_8
action_45 (12) = happyGoto action_9
action_45 (13) = happyGoto action_10
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (19) = happyShift action_31
action_46 (33) = happyShift action_32
action_46 (34) = happyShift action_33
action_46 (36) = happyShift action_34
action_46 (37) = happyShift action_35
action_46 (39) = happyShift action_36
action_46 (13) = happyGoto action_26
action_46 (14) = happyGoto action_84
action_46 (15) = happyGoto action_28
action_46 (16) = happyGoto action_29
action_46 (17) = happyGoto action_30
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (19) = happyShift action_31
action_47 (33) = happyShift action_32
action_47 (34) = happyShift action_33
action_47 (36) = happyShift action_34
action_47 (37) = happyShift action_35
action_47 (39) = happyShift action_36
action_47 (13) = happyGoto action_26
action_47 (14) = happyGoto action_83
action_47 (15) = happyGoto action_28
action_47 (16) = happyGoto action_29
action_47 (17) = happyGoto action_30
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (19) = happyShift action_31
action_48 (33) = happyShift action_32
action_48 (34) = happyShift action_33
action_48 (36) = happyShift action_34
action_48 (37) = happyShift action_35
action_48 (39) = happyShift action_36
action_48 (13) = happyGoto action_26
action_48 (14) = happyGoto action_82
action_48 (15) = happyGoto action_28
action_48 (16) = happyGoto action_29
action_48 (17) = happyGoto action_30
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (19) = happyShift action_31
action_49 (33) = happyShift action_32
action_49 (34) = happyShift action_33
action_49 (36) = happyShift action_34
action_49 (37) = happyShift action_35
action_49 (39) = happyShift action_36
action_49 (13) = happyGoto action_26
action_49 (14) = happyGoto action_81
action_49 (15) = happyGoto action_28
action_49 (16) = happyGoto action_29
action_49 (17) = happyGoto action_30
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (19) = happyShift action_31
action_50 (33) = happyShift action_32
action_50 (34) = happyShift action_33
action_50 (36) = happyShift action_34
action_50 (37) = happyShift action_35
action_50 (39) = happyShift action_36
action_50 (13) = happyGoto action_26
action_50 (14) = happyGoto action_80
action_50 (15) = happyGoto action_28
action_50 (16) = happyGoto action_29
action_50 (17) = happyGoto action_30
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (19) = happyShift action_31
action_51 (33) = happyShift action_32
action_51 (34) = happyShift action_33
action_51 (36) = happyShift action_34
action_51 (37) = happyShift action_35
action_51 (39) = happyShift action_36
action_51 (13) = happyGoto action_26
action_51 (14) = happyGoto action_79
action_51 (15) = happyGoto action_28
action_51 (16) = happyGoto action_29
action_51 (17) = happyGoto action_30
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (19) = happyShift action_31
action_52 (33) = happyShift action_32
action_52 (34) = happyShift action_33
action_52 (36) = happyShift action_34
action_52 (37) = happyShift action_35
action_52 (39) = happyShift action_36
action_52 (13) = happyGoto action_26
action_52 (14) = happyGoto action_78
action_52 (15) = happyGoto action_28
action_52 (16) = happyGoto action_29
action_52 (17) = happyGoto action_30
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (19) = happyShift action_31
action_53 (33) = happyShift action_32
action_53 (34) = happyShift action_33
action_53 (36) = happyShift action_34
action_53 (37) = happyShift action_35
action_53 (39) = happyShift action_36
action_53 (13) = happyGoto action_26
action_53 (14) = happyGoto action_77
action_53 (15) = happyGoto action_28
action_53 (16) = happyGoto action_29
action_53 (17) = happyGoto action_30
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyShift action_31
action_54 (33) = happyShift action_32
action_54 (34) = happyShift action_33
action_54 (36) = happyShift action_34
action_54 (37) = happyShift action_35
action_54 (39) = happyShift action_36
action_54 (13) = happyGoto action_26
action_54 (14) = happyGoto action_76
action_54 (15) = happyGoto action_28
action_54 (16) = happyGoto action_29
action_54 (17) = happyGoto action_30
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (19) = happyShift action_31
action_55 (33) = happyShift action_32
action_55 (34) = happyShift action_33
action_55 (36) = happyShift action_34
action_55 (37) = happyShift action_35
action_55 (39) = happyShift action_36
action_55 (13) = happyGoto action_26
action_55 (14) = happyGoto action_75
action_55 (15) = happyGoto action_28
action_55 (16) = happyGoto action_29
action_55 (17) = happyGoto action_30
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (19) = happyShift action_31
action_56 (33) = happyShift action_32
action_56 (34) = happyShift action_33
action_56 (36) = happyShift action_34
action_56 (37) = happyShift action_35
action_56 (39) = happyShift action_36
action_56 (13) = happyGoto action_26
action_56 (14) = happyGoto action_74
action_56 (15) = happyGoto action_28
action_56 (16) = happyGoto action_29
action_56 (17) = happyGoto action_30
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (18) = happyShift action_11
action_57 (25) = happyShift action_12
action_57 (28) = happyShift action_13
action_57 (29) = happyShift action_14
action_57 (30) = happyShift action_15
action_57 (31) = happyShift action_16
action_57 (32) = happyShift action_17
action_57 (35) = happyShift action_18
action_57 (36) = happyShift action_19
action_57 (5) = happyGoto action_73
action_57 (6) = happyGoto action_3
action_57 (7) = happyGoto action_4
action_57 (8) = happyGoto action_5
action_57 (9) = happyGoto action_6
action_57 (10) = happyGoto action_7
action_57 (11) = happyGoto action_8
action_57 (12) = happyGoto action_9
action_57 (13) = happyGoto action_10
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (40) = happyShift action_48
action_58 (41) = happyShift action_49
action_58 (43) = happyShift action_50
action_58 (44) = happyShift action_51
action_58 (45) = happyShift action_52
action_58 (46) = happyShift action_53
action_58 (47) = happyShift action_54
action_58 (48) = happyShift action_55
action_58 (49) = happyShift action_56
action_58 _ = happyReduce_37

action_59 (37) = happyShift action_72
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (20) = happyShift action_71
action_60 (38) = happyShift action_46
action_60 (39) = happyShift action_47
action_60 (40) = happyShift action_48
action_60 (41) = happyShift action_49
action_60 (43) = happyShift action_50
action_60 (44) = happyShift action_51
action_60 (45) = happyShift action_52
action_60 (46) = happyShift action_53
action_60 (47) = happyShift action_54
action_60 (48) = happyShift action_55
action_60 (49) = happyShift action_56
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (18) = happyShift action_11
action_61 (25) = happyShift action_12
action_61 (28) = happyShift action_13
action_61 (29) = happyShift action_14
action_61 (30) = happyShift action_15
action_61 (31) = happyShift action_16
action_61 (32) = happyShift action_17
action_61 (35) = happyShift action_18
action_61 (36) = happyShift action_19
action_61 (5) = happyGoto action_70
action_61 (6) = happyGoto action_3
action_61 (7) = happyGoto action_4
action_61 (8) = happyGoto action_5
action_61 (9) = happyGoto action_6
action_61 (10) = happyGoto action_7
action_61 (11) = happyGoto action_8
action_61 (12) = happyGoto action_9
action_61 (13) = happyGoto action_10
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (37) = happyShift action_69
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (19) = happyShift action_31
action_63 (33) = happyShift action_32
action_63 (34) = happyShift action_33
action_63 (36) = happyShift action_34
action_63 (37) = happyShift action_35
action_63 (39) = happyShift action_36
action_63 (13) = happyGoto action_26
action_63 (14) = happyGoto action_68
action_63 (15) = happyGoto action_28
action_63 (16) = happyGoto action_29
action_63 (17) = happyGoto action_30
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (38) = happyShift action_46
action_64 (39) = happyShift action_47
action_64 (40) = happyShift action_48
action_64 (41) = happyShift action_49
action_64 (43) = happyShift action_50
action_64 (44) = happyShift action_51
action_64 (45) = happyShift action_52
action_64 (46) = happyShift action_53
action_64 (47) = happyShift action_54
action_64 (48) = happyShift action_55
action_64 (49) = happyShift action_56
action_64 _ = happyReduce_17

action_65 (24) = happyShift action_67
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_27

action_67 (42) = happyShift action_93
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (38) = happyShift action_46
action_68 (39) = happyShift action_47
action_68 (40) = happyShift action_48
action_68 (41) = happyShift action_49
action_68 (43) = happyShift action_50
action_68 (44) = happyShift action_51
action_68 (45) = happyShift action_52
action_68 (46) = happyShift action_53
action_68 (47) = happyShift action_54
action_68 (48) = happyShift action_55
action_68 (49) = happyShift action_56
action_68 _ = happyReduce_15

action_69 (24) = happyShift action_92
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (18) = happyShift action_11
action_70 (22) = happyShift action_91
action_70 (25) = happyShift action_12
action_70 (28) = happyShift action_13
action_70 (29) = happyShift action_14
action_70 (30) = happyShift action_15
action_70 (31) = happyShift action_16
action_70 (32) = happyShift action_17
action_70 (35) = happyShift action_18
action_70 (36) = happyShift action_19
action_70 (6) = happyGoto action_44
action_70 (7) = happyGoto action_4
action_70 (8) = happyGoto action_5
action_70 (9) = happyGoto action_6
action_70 (10) = happyGoto action_7
action_70 (11) = happyGoto action_8
action_70 (12) = happyGoto action_9
action_70 (13) = happyGoto action_10
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_31

action_72 (24) = happyShift action_90
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (18) = happyShift action_11
action_73 (22) = happyShift action_89
action_73 (25) = happyShift action_12
action_73 (28) = happyShift action_13
action_73 (29) = happyShift action_14
action_73 (30) = happyShift action_15
action_73 (31) = happyShift action_16
action_73 (32) = happyShift action_17
action_73 (35) = happyShift action_18
action_73 (36) = happyShift action_19
action_73 (6) = happyGoto action_44
action_73 (7) = happyGoto action_4
action_73 (8) = happyGoto action_5
action_73 (9) = happyGoto action_6
action_73 (10) = happyGoto action_7
action_73 (11) = happyGoto action_8
action_73 (12) = happyGoto action_9
action_73 (13) = happyGoto action_10
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (38) = happyShift action_46
action_74 (39) = happyShift action_47
action_74 (40) = happyShift action_48
action_74 (41) = happyShift action_49
action_74 (43) = happyShift action_50
action_74 (44) = happyShift action_51
action_74 (45) = happyShift action_52
action_74 (46) = happyShift action_53
action_74 (47) = happyShift action_54
action_74 (48) = happyShift action_55
action_74 (49) = happyShift action_56
action_74 _ = happyReduce_49

action_75 (38) = happyShift action_46
action_75 (39) = happyShift action_47
action_75 (40) = happyShift action_48
action_75 (41) = happyShift action_49
action_75 (43) = happyShift action_50
action_75 (44) = happyShift action_51
action_75 (45) = happyShift action_52
action_75 (46) = happyShift action_53
action_75 (47) = happyShift action_54
action_75 (48) = happyShift action_55
action_75 (49) = happyShift action_56
action_75 _ = happyReduce_48

action_76 (38) = happyShift action_46
action_76 (39) = happyShift action_47
action_76 (40) = happyShift action_48
action_76 (41) = happyShift action_49
action_76 (43) = happyShift action_50
action_76 (44) = happyShift action_51
action_76 (45) = happyShift action_52
action_76 (46) = happyShift action_53
action_76 (47) = happyShift action_54
action_76 (48) = happyShift action_55
action_76 (49) = happyShift action_56
action_76 _ = happyReduce_47

action_77 (38) = happyShift action_46
action_77 (39) = happyShift action_47
action_77 (40) = happyShift action_48
action_77 (41) = happyShift action_49
action_77 (43) = happyShift action_50
action_77 (44) = happyShift action_51
action_77 (45) = happyShift action_52
action_77 (46) = happyShift action_53
action_77 (47) = happyShift action_54
action_77 (48) = happyShift action_55
action_77 (49) = happyShift action_56
action_77 _ = happyReduce_45

action_78 (38) = happyShift action_46
action_78 (39) = happyShift action_47
action_78 (40) = happyShift action_48
action_78 (41) = happyShift action_49
action_78 (43) = happyShift action_50
action_78 (44) = happyShift action_51
action_78 (45) = happyShift action_52
action_78 (46) = happyShift action_53
action_78 (47) = happyShift action_54
action_78 (48) = happyShift action_55
action_78 (49) = happyShift action_56
action_78 _ = happyReduce_46

action_79 (38) = happyShift action_46
action_79 (39) = happyShift action_47
action_79 (40) = happyShift action_48
action_79 (41) = happyShift action_49
action_79 (43) = happyShift action_50
action_79 (44) = happyShift action_51
action_79 (45) = happyShift action_52
action_79 (46) = happyShift action_53
action_79 (47) = happyShift action_54
action_79 (48) = happyShift action_55
action_79 (49) = happyShift action_56
action_79 _ = happyReduce_44

action_80 (40) = happyShift action_48
action_80 (41) = happyShift action_49
action_80 (44) = happyShift action_51
action_80 (45) = happyShift action_52
action_80 (46) = happyShift action_53
action_80 (47) = happyShift action_54
action_80 (48) = happyShift action_55
action_80 (49) = happyShift action_56
action_80 _ = happyReduce_36

action_81 (44) = happyShift action_51
action_81 (45) = happyShift action_52
action_81 (46) = happyShift action_53
action_81 (47) = happyShift action_54
action_81 (48) = happyShift action_55
action_81 (49) = happyShift action_56
action_81 _ = happyReduce_35

action_82 (44) = happyShift action_51
action_82 (45) = happyShift action_52
action_82 (46) = happyShift action_53
action_82 (47) = happyShift action_54
action_82 (48) = happyShift action_55
action_82 (49) = happyShift action_56
action_82 _ = happyReduce_34

action_83 (40) = happyShift action_48
action_83 (41) = happyShift action_49
action_83 (43) = happyShift action_50
action_83 (44) = happyShift action_51
action_83 (45) = happyShift action_52
action_83 (46) = happyShift action_53
action_83 (47) = happyShift action_54
action_83 (48) = happyShift action_55
action_83 (49) = happyShift action_56
action_83 _ = happyReduce_33

action_84 (40) = happyShift action_48
action_84 (41) = happyShift action_49
action_84 (43) = happyShift action_50
action_84 (44) = happyShift action_51
action_84 (45) = happyShift action_52
action_84 (46) = happyShift action_53
action_84 (47) = happyShift action_54
action_84 (48) = happyShift action_55
action_84 (49) = happyShift action_56
action_84 _ = happyReduce_32

action_85 (27) = happyShift action_88
action_85 _ = happyReduce_22

action_86 (18) = happyShift action_11
action_86 (25) = happyShift action_12
action_86 (28) = happyShift action_13
action_86 (29) = happyShift action_14
action_86 (30) = happyShift action_15
action_86 (31) = happyShift action_16
action_86 (32) = happyShift action_17
action_86 (35) = happyShift action_18
action_86 (36) = happyShift action_19
action_86 (5) = happyGoto action_87
action_86 (6) = happyGoto action_3
action_86 (7) = happyGoto action_4
action_86 (8) = happyGoto action_5
action_86 (9) = happyGoto action_6
action_86 (10) = happyGoto action_7
action_86 (11) = happyGoto action_8
action_86 (12) = happyGoto action_9
action_86 (13) = happyGoto action_10
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (18) = happyShift action_11
action_87 (22) = happyShift action_97
action_87 (25) = happyShift action_12
action_87 (28) = happyShift action_13
action_87 (29) = happyShift action_14
action_87 (30) = happyShift action_15
action_87 (31) = happyShift action_16
action_87 (32) = happyShift action_17
action_87 (35) = happyShift action_18
action_87 (36) = happyShift action_19
action_87 (6) = happyGoto action_44
action_87 (7) = happyGoto action_4
action_87 (8) = happyGoto action_5
action_87 (9) = happyGoto action_6
action_87 (10) = happyGoto action_7
action_87 (11) = happyGoto action_8
action_87 (12) = happyGoto action_9
action_87 (13) = happyGoto action_10
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (18) = happyShift action_11
action_88 (25) = happyShift action_12
action_88 (28) = happyShift action_13
action_88 (29) = happyShift action_14
action_88 (30) = happyShift action_15
action_88 (31) = happyShift action_16
action_88 (32) = happyShift action_17
action_88 (35) = happyShift action_18
action_88 (36) = happyShift action_19
action_88 (6) = happyGoto action_96
action_88 (7) = happyGoto action_4
action_88 (8) = happyGoto action_5
action_88 (9) = happyGoto action_6
action_88 (10) = happyGoto action_7
action_88 (11) = happyGoto action_8
action_88 (12) = happyGoto action_9
action_88 (13) = happyGoto action_10
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_23

action_90 _ = happyReduce_39

action_91 _ = happyReduce_26

action_92 (42) = happyShift action_95
action_92 _ = happyReduce_14

action_93 (19) = happyShift action_31
action_93 (33) = happyShift action_32
action_93 (34) = happyShift action_33
action_93 (36) = happyShift action_34
action_93 (37) = happyShift action_35
action_93 (39) = happyShift action_36
action_93 (13) = happyGoto action_26
action_93 (14) = happyGoto action_94
action_93 (15) = happyGoto action_28
action_93 (16) = happyGoto action_29
action_93 (17) = happyGoto action_30
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (38) = happyShift action_46
action_94 (39) = happyShift action_47
action_94 (40) = happyShift action_48
action_94 (41) = happyShift action_49
action_94 (43) = happyShift action_50
action_94 (44) = happyShift action_51
action_94 (45) = happyShift action_52
action_94 (46) = happyShift action_53
action_94 (47) = happyShift action_54
action_94 (48) = happyShift action_55
action_94 (49) = happyShift action_56
action_94 _ = happyReduce_18

action_95 (19) = happyShift action_31
action_95 (33) = happyShift action_32
action_95 (34) = happyShift action_33
action_95 (36) = happyShift action_34
action_95 (37) = happyShift action_35
action_95 (39) = happyShift action_36
action_95 (13) = happyGoto action_26
action_95 (14) = happyGoto action_99
action_95 (15) = happyGoto action_28
action_95 (16) = happyGoto action_29
action_95 (17) = happyGoto action_30
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_21

action_97 (27) = happyShift action_98
action_97 _ = happyReduce_20

action_98 (21) = happyShift action_100
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (38) = happyShift action_46
action_99 (39) = happyShift action_47
action_99 (40) = happyShift action_48
action_99 (41) = happyShift action_49
action_99 (43) = happyShift action_50
action_99 (44) = happyShift action_51
action_99 (45) = happyShift action_52
action_99 (46) = happyShift action_53
action_99 (47) = happyShift action_54
action_99 (48) = happyShift action_55
action_99 (49) = happyShift action_56
action_99 _ = happyReduce_13

action_100 (18) = happyShift action_11
action_100 (25) = happyShift action_12
action_100 (28) = happyShift action_13
action_100 (29) = happyShift action_14
action_100 (30) = happyShift action_15
action_100 (31) = happyShift action_16
action_100 (32) = happyShift action_17
action_100 (35) = happyShift action_18
action_100 (36) = happyShift action_19
action_100 (5) = happyGoto action_101
action_100 (6) = happyGoto action_3
action_100 (7) = happyGoto action_4
action_100 (8) = happyGoto action_5
action_100 (9) = happyGoto action_6
action_100 (10) = happyGoto action_7
action_100 (11) = happyGoto action_8
action_100 (12) = happyGoto action_9
action_100 (13) = happyGoto action_10
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (18) = happyShift action_11
action_101 (22) = happyShift action_102
action_101 (25) = happyShift action_12
action_101 (28) = happyShift action_13
action_101 (29) = happyShift action_14
action_101 (30) = happyShift action_15
action_101 (31) = happyShift action_16
action_101 (32) = happyShift action_17
action_101 (35) = happyShift action_18
action_101 (36) = happyShift action_19
action_101 (6) = happyGoto action_44
action_101 (7) = happyGoto action_4
action_101 (8) = happyGoto action_5
action_101 (9) = happyGoto action_6
action_101 (10) = happyGoto action_7
action_101 (11) = happyGoto action_8
action_101 (12) = happyGoto action_9
action_101 (13) = happyGoto action_10
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_19

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 ++ "\tSTOP\n"
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 ++ happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn6
		 (""
	)

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2 ++ "\tOUT\n"
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  7 happyReduction_11
happyReduction_11 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2 ++"\tSWAP\n"
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  7 happyReduction_12
happyReduction_12 (HappyTerminal (TK_VAR _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 ("\tPUSH\t" ++ happy_var_2 ++ "\n\tIN\n\tSTORE\n"
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 7 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn14  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_INT _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_VAR _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (declareTable happy_var_2 happy_var_4 0 happy_var_7
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 8 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyTerminal (TK_INT _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_VAR _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (declareTable happy_var_2 happy_var_4 0 "\tPUSH\t0\n"
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 8 happyReduction_15
happyReduction_15 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_VAR _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (happy_var_2 ++ "\tDS\t1\n\tPUSH\t" ++ happy_var_2 ++ "\n" ++ happy_var_4 ++ "\tSTORE\n"
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 (HappyTerminal (TK_VAR _ happy_var_2))
	_
	 =  HappyAbsSyn8
		 (happy_var_2 ++ "\tDS\t1\n"
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (TK_VAR _ happy_var_1))
	 =  HappyAbsSyn8
		 ("\tPUSH\t" ++ happy_var_1 ++ "\n" ++ happy_var_3 ++ "\tSTORE\n"
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 6 8 happyReduction_18
happyReduction_18 ((HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_INT _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_VAR _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ("\tPUSH\t" ++ happy_var_1 ++ "__" ++ (show happy_var_3) ++ "\n" ++ happy_var_6 ++ "\tSTORE\n"
	) `HappyStk` happyRest

happyReduce_19 = happyMonadReduce 10 9 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((( mkBranch happy_var_2 happy_var_5 happy_var_9))
	) (\r -> happyReturn (HappyAbsSyn9 r))

happyReduce_20 = happyMonadReduce 6 9 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((( mkBranch happy_var_2 happy_var_5 ""))
	) (\r -> happyReturn (HappyAbsSyn9 r))

happyReduce_21 = happyMonadReduce 6 9 happyReduction_21
happyReduction_21 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((( mkBranch happy_var_2 happy_var_4 happy_var_6))
	) (\r -> happyReturn (HappyAbsSyn9 r))

happyReduce_22 = happyMonadReduce 4 9 happyReduction_22
happyReduction_22 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((( mkBranch happy_var_2 happy_var_4 ""))
	) (\r -> happyReturn (HappyAbsSyn9 r))

happyReduce_23 = happyMonadReduce 5 10 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((( mkWhile happy_var_2 happy_var_4))
	) (\r -> happyReturn (HappyAbsSyn10 r))

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  11 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 5 12 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_VAR _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 ("\tPUSH\t_eof_" ++ happy_var_2 ++ "\n\tGOTO\n_sof_" ++ happy_var_2 ++ "\tEQU\t*\n" ++ happy_var_4 ++ "\tGOTO\n_eof_"++happy_var_2++"\tEQU\t*\n"
	) `HappyStk` happyRest

happyReduce_27 = happyMonadReduce 3 13 happyReduction_27
happyReduction_27 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_VAR _ happy_var_1)) `HappyStk`
	happyRest) tk
	 = happyThen ((( mkFnCall happy_var_1))
	) (\r -> happyReturn (HappyAbsSyn13 r))

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  14 happyReduction_29
happyReduction_29 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  15 happyReduction_32
happyReduction_32 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ happy_var_3 ++ "\tADD\n"
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  15 happyReduction_33
happyReduction_33 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ happy_var_3 ++ "\tSUB\n"
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  15 happyReduction_34
happyReduction_34 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ happy_var_3 ++ "\tMUL\n"
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  15 happyReduction_35
happyReduction_35 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ happy_var_3 ++ "\tDIV\n"
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  15 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ happy_var_3 ++ happy_var_1 ++ happy_var_3 ++ "\tDIV\n\tMUL\n\tSUB\n"
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  15 happyReduction_37
happyReduction_37 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn15
		 ("\tPUSH\t0\n" ++ happy_var_2 ++ "\tSUB\n"
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  16 happyReduction_38
happyReduction_38 (HappyTerminal (TK_INT _ happy_var_1))
	 =  HappyAbsSyn16
		 ("\tPUSH\t" ++ (show happy_var_1) ++ "\n"
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 16 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyTerminal (TK_INT _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_VAR _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 ("\tPUSH\t" ++ happy_var_1 ++ "__" ++ (show happy_var_3) ++ "\n\tLOAD\n"
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_1  16 happyReduction_40
happyReduction_40 (HappyTerminal (TK_VAR _ happy_var_1))
	 =  HappyAbsSyn16
		 ("\tPUSH\t" ++ happy_var_1 ++ "\n\tLOAD\n"
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn16
		 ("\tPUSH\t1\n"
	)

happyReduce_42 = happySpecReduce_1  16 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn16
		 ("\tPUSH\t0\n"
	)

happyReduce_43 = happySpecReduce_1  16 happyReduction_43
happyReduction_43 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happyMonadReduce 3 17 happyReduction_44
happyReduction_44 ((HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen ((( mkInfsTest happy_var_1 happy_var_3))
	) (\r -> happyReturn (HappyAbsSyn17 r))

happyReduce_45 = happyMonadReduce 3 17 happyReduction_45
happyReduction_45 ((HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen ((( mkInfsTest ("\tPUSH\t0\n" ++ happy_var_1 ++ "\tSUB\n") ("\tPUSH\t0\n" ++ happy_var_3 ++ "\tSUB\n")))
	) (\r -> happyReturn (HappyAbsSyn17 r))

happyReduce_46 = happyMonadReduce 3 17 happyReduction_46
happyReduction_46 ((HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen ((( mkInfsTest (happy_var_1 ++ "\tPUSH\t1\n\tSUB\n") happy_var_3))
	) (\r -> happyReturn (HappyAbsSyn17 r))

happyReduce_47 = happyMonadReduce 3 17 happyReduction_47
happyReduction_47 ((HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen ((( mkInfsTest ("\tPUSH\t0\n" ++ happy_var_1 ++ "\tSUB\n\tPUSH\t1\n\tSUB\n") ("\tPUSH\t0\n" ++ happy_var_3 ++ "\tSUB\n")))
	) (\r -> happyReturn (HappyAbsSyn17 r))

happyReduce_48 = happyMonadReduce 3 17 happyReduction_48
happyReduction_48 ((HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen ((( mkEqTest happy_var_1 happy_var_3))
	) (\r -> happyReturn (HappyAbsSyn17 r))

happyReduce_49 = happyMonadReduce 3 17 happyReduction_49
happyReduction_49 ((HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_1) `HappyStk`
	happyRest) tk
	 = happyThen ((( mkDfTest happy_var_1 happy_var_3))
	) (\r -> happyReturn (HappyAbsSyn17 r))

happyNewToken action sts stk [] =
	action 50 50 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TK_SEP _ -> cont 18;
	TK_OPP _ -> cont 19;
	TK_CLP _ -> cont 20;
	TK_OPCB _ -> cont 21;
	TK_CLCB _ -> cont 22;
	TK_OPBR _ -> cont 23;
	TK_CLBR _ -> cont 24;
	TK_IF _ -> cont 25;
	TK_THEN _ -> cont 26;
	TK_ELSE _ -> cont 27;
	TK_WHILE _ -> cont 28;
	TK_PRINT _ -> cont 29;
	TK_INPUT _ -> cont 30;
	TK_RETURN _ -> cont 31;
	TK_DEF _ -> cont 32;
	TK_TRUE _ -> cont 33;
	TK_FALSE _ -> cont 34;
	TK_DECLARATION _ -> cont 35;
	TK_VAR _ happy_dollar_dollar -> cont 36;
	TK_INT _ happy_dollar_dollar -> cont 37;
	TK_ADD  _ -> cont 38;
	TK_SUB  _ -> cont 39;
	TK_MUL  _ -> cont 40;
	TK_DIV  _ -> cont 41;
	TK_EQ   _ -> cont 42;
	TK_MOD  _ -> cont 43;
	TK_INFS _ -> cont 44;
	TK_INFE _ -> cont 45;
	TK_SUPS _ -> cont 46;
	TK_SUPE _ -> cont 47;
	TK_ISEQ _ -> cont 48;
	TK_ISDF _ -> cont 49;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 50 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => ParseResult a -> (a -> ParseResult b) -> ParseResult b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> ParseResult a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> ParseResult a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> ParseResult a
happyError' = (\(tokens, _) -> parseError tokens)
parse tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
