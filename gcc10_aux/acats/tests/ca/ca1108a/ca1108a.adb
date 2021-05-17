

WITH REPORT, CA1108A_PKG;
USE REPORT, CA1108A_PKG;
PROCEDURE CA1108A IS

     VAR1, VAR2 : INTEGER;

BEGIN  

     TEST ("CA1108A", "WITH_ AND USE_CLAUSES GIVEN FOR A PACKAGE " &
                      "SPEC APPLY TO THE BODY AND ITS SUBUNITS");

     PROC;

     VAR1 := 1;
     VAR2 := 1;
     CALL_SUBS (VAR1, VAR2);
     IF VAR1 /= 4 THEN
          FAILED ("OTHER_PKG VARIABLE NOT VISIBLE IN SUBUNIT");
     END IF;

     IF VAR2 /= 6 THEN
          FAILED ("OTHER_PKG FUNCTION NOT VISIBLE IN SUBUNIT " &
                  "OF SUBUNIT");
     END IF;

     RESULT;

END CA1108A;
