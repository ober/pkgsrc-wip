

-- CASE C:
GENERIC
     TYPE FUNNY_TYPE IS PRIVATE;
PACKAGE B83004B_PACK3 IS
     NEW_VAR : BOOLEAN;
     TYPE ARR1 IS ARRAY (1..2) OF CHARACTER;
     TYPE ARR2 IS ARRAY (1..2) OF ARR1;
     TYPE ARR3 IS ARRAY (1..2) OF ARR2;
     TYPE ARR4 IS ARRAY (1..2) OF ARR3;
     TYPE ARR5 IS ARRAY (1..2) OF ARR4;
     TYPE ARR6 IS ARRAY (1..2) OF ARR5;
     ARRAY_OBJECT : ARR6;

     FUNCTION FUNNY (A : FUNNY_TYPE) RETURN FUNNY_TYPE;

END B83004B_PACK3;
