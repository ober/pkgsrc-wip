

WITH REPORT; USE REPORT;
PRAGMA ELABORATE (REPORT);
PACKAGE BODY LA5001A0 IS

     FUNCTION RF (X : STRING) RETURN INTEGER IS
     BEGIN
          FAILED (X & " DECLARATION ELABORATED");
          RETURN 0;
     END RF;

BEGIN

     TEST ("LA5001A","INCONSISTENT ELABORATION ORDER OF LIBRARY UNITS");
     FAILED ("LA5001A0 BODY ELABORATED");

END LA5001A0;
