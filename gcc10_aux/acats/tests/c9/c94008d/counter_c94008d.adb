
PACKAGE BODY COUNTER_C94008D IS
     PROCEDURE UPDATE (VAR : IN OUT INTEGER; VAL : INTEGER) IS
     BEGIN
          VAR := VAR + VAL;
     END UPDATE;

     PROCEDURE SET (VAR : OUT INTEGER; VAL : INTEGER) IS
     BEGIN
          VAR := VAL;
     END SET;
END COUNTER_C94008D;
