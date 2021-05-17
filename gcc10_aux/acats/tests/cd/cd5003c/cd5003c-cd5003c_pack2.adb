
WITH SPPRT13;
WITH REPORT; USE REPORT;
PRAGMA ELABORATE (SPPRT13);
PRAGMA ELABORATE (REPORT);
SEPARATE (CD5003C)
PACKAGE BODY CD5003C_PACK2 IS
     TYPE ATYPE IS ARRAY (1 .. 10) OF INTEGER;

     TEST_VAR : ATYPE := (OTHERS => 0);
     FOR TEST_VAR USE AT SPPRT13.VARIABLE_ADDRESS;
     USE SYSTEM;

     FUNCTION IDENT (P : ATYPE) RETURN ATYPE IS
     BEGIN
          IF EQUAL (3, 3) THEN
               RETURN P;
          ELSE
               RETURN (OTHERS => 0);
          END IF;
     END IDENT;
BEGIN
     TEST ("CD5003C", "A 'WITH' CLAUSE NAMING 'SYSTEM' NEED NOT " &
                      "BE GIVEN FOR A PACKAGE BODY SUBUNIT " &
                      "CONTAINING AN ADDRESS CLAUSE AS LONG AS A " &
                      "'WITH' CLAUSE IS GIVEN FOR THE UNIT " &
                      "CONTAINING THE PACKAGE SPECIFICATION");


     TEST_VAR := IDENT (ATYPE'(OTHERS => 3));

     IF TEST_VAR /= ATYPE'(OTHERS => 3) THEN
          FAILED ("INCORRECT VALUE FOR TEST_VAR");
     END IF;

     IF TEST_VAR'ADDRESS /= SPPRT13.VARIABLE_ADDRESS THEN
          FAILED ("INCORRECT ADDRESS FOR TEST_VAR");
     END IF;
END CD5003C_PACK2;
