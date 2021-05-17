
WITH SPPRT13;
WITH REPORT; USE REPORT;
PRAGMA ELABORATE (SPPRT13);
PRAGMA ELABORATE (REPORT);
SEPARATE (CD5003D_PACK2)
PROCEDURE CD5003D_PROC2 IS
     TYPE FIXD IS DELTA 0.1 RANGE -10.0 .. 10.0;

     TEST_VAR : FIXD := 0.0;
     FOR TEST_VAR USE AT SPPRT13.VARIABLE_ADDRESS;
     USE SYSTEM;

     FUNCTION IDENT_FIXD (P : FIXD) RETURN FIXD IS
     BEGIN
          IF EQUAL (3, 3) THEN
               RETURN P;
          ELSE
               RETURN 0.0;
          END IF;
     END IDENT_FIXD;
BEGIN
     TEST ("CD5003D", "A 'WITH' CLAUSE NAMING 'SYSTEM' NEED NOT BE " &
                      "GIVEN FOR A PROCEDURE BODY SUBUNIT " &
                      "CONTAINING AN ADDRESS CLAUSE AS LONG AS A " &
                      "'WITH' CLAUSE IS GIVEN FOR THE UNIT " &
                      "CONTAINING THE PROCEDURE SPECIFICATION");

     TEST_VAR := IDENT_FIXD (3.3);

     IF TEST_VAR /= 3.3 THEN
          FAILED ("INCORRECT VALUE FOR TEST_VAR");
     END IF;

     IF TEST_VAR'ADDRESS /= SPPRT13.VARIABLE_ADDRESS THEN
          FAILED ("INCORRECT ADDRESS FOR TEST_VAR");
     END IF;

    RESULT;
END CD5003D_PROC2;
