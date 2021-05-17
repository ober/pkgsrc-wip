
PROCEDURE CA3011A0 (Z : OUT T) IS
     T1 : T;

     FUNCTION CA3011A1 RETURN T IS SEPARATE;

     PROCEDURE CA3011A2 (Y : OUT T) IS SEPARATE;

     PACKAGE CA3011A3 IS
          FUNCTION CA3011A3F RETURN T;
     END CA3011A3;

     PACKAGE BODY CA3011A3 IS SEPARATE;

BEGIN
     IF CA3011A1 /= X THEN
          FAILED ( "INCORRECT VALUE RETURNED BY FUNCTION CA3011A1" );
     END IF;

     CA3011A2 (T1);

     IF T1 /= X THEN
          FAILED ( "INCORRECT VALUE RETURNED BY PROCEDURE CA3011A2 " );
     END IF;

     IF CA3011A3.CA3011A3F /= X THEN
          FAILED ( "INCORRECT VALUE RETURNED BY FUNCTION CA3011A3F " );
     END IF;

     Z := X;

END CA3011A0;
