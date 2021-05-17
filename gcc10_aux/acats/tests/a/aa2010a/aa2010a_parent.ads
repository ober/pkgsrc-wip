
WITH AA2010A_TYPEDEF; USE AA2010A_TYPEDEF;
PACKAGE AA2010A_PARENT IS

     PROCEDURE BOOLEAN;
     FUNCTION INTEGER RETURN ENUM;
     PACKAGE FLOAT IS END FLOAT;

     PROCEDURE CHARACTER;
     FUNCTION ASCII RETURN ENUM;

     TASK NATURAL IS
          ENTRY E;
     END NATURAL;

     PROCEDURE POSITIVE;
     FUNCTION STRING RETURN ENUM;
     PACKAGE DURATION IS END DURATION;

     PROCEDURE CONSTRAINT_ERROR;
     FUNCTION NUMERIC_ERROR RETURN ENUM;

     TASK PROGRAM_ERROR IS
          ENTRY E;
     END PROGRAM_ERROR;

     PROCEDURE STORAGE_ERROR;
     FUNCTION TASKING_ERROR RETURN ENUM;

END AA2010A_PARENT;
