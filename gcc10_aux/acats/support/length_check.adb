
WITH UNCHECKED_CONVERSION;
WITH REPORT; USE REPORT;

PROCEDURE LENGTH_CHECK (TEST_VALUE      : TEST_TYPE; 
                        EXPECTED_LENGTH : INTEGER;
                        TYPE_ID         : STRING) IS
   LEN : CONSTANT INTEGER := EXPECTED_LENGTH;
   TYPE BIT_ARRAY_TYPE IS ARRAY (1 .. LEN) OF BOOLEAN;
   PRAGMA PACK (BIT_ARRAY_TYPE);
   TYPE NEW_BIT_ARRAY_TYPE IS ARRAY (1 .. 3) OF BIT_ARRAY_TYPE;

   FUNCTION TO_BITS IS NEW UNCHECKED_CONVERSION (TEST_TYPE,
                                                 BIT_ARRAY_TYPE);
   FUNCTION FROM_BITS IS NEW UNCHECKED_CONVERSION (BIT_ARRAY_TYPE,
                                                   TEST_TYPE);

   BIT_ARRAY : BIT_ARRAY_TYPE := (OTHERS => FALSE);

   BIT_ARRAY_NEW : NEW_BIT_ARRAY_TYPE := (OTHERS => (OTHERS => FALSE));
BEGIN

   BIT_ARRAY := TO_BITS (TEST_VALUE);

   FOR I IN 1 .. LEN LOOP
        BIT_ARRAY_NEW(IDENT_INT(1)) (IDENT_INT(I)) := BIT_ARRAY(I);
   END LOOP;

   IF TEST_VALUE /= FROM_BITS (BIT_ARRAY_NEW(1)) THEN
      FAILED ("CHECK ON REPRESENTATION FOR " & TYPE_ID & " FAILED.");
   END IF;

END LENGTH_CHECK;
