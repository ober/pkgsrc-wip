-- C45504C.DEP

--                             Grant of Unlimited Rights
--
--     Under contracts F33600-87-D-0337, F33600-84-D-0280, MDA903-79-C-0687,
--     F08630-91-C-0015, and DCA100-97-D-0025, the U.S. Government obtained 
--     unlimited rights in the software and documentation contained herein.
--     Unlimited rights are defined in DFAR 252.227-7013(a)(19).  By making 
--     this public release, the Government intends to confer upon all 
--     recipients unlimited rights  equal to those held by the Government.  
--     These rights include rights to use, duplicate, release or disclose the 
--     released technical data and computer software in whole or in part, in 
--     any manner and for any purpose whatsoever, and to have or permit others 
--     to do so.
--
--                                    DISCLAIMER
--
--     ALL MATERIALS OR INFORMATION HEREIN RELEASED, MADE AVAILABLE OR
--     DISCLOSED ARE AS IS.  THE GOVERNMENT MAKES NO EXPRESS OR IMPLIED 
--     WARRANTY AS TO ANY MATTER WHATSOEVER, INCLUDING THE CONDITIONS OF THE
--     SOFTWARE, DOCUMENTATION OR OTHER INFORMATION RELEASED, MADE AVAILABLE 
--     OR DISCLOSED, OR THE OWNERSHIP, MERCHANTABILITY, OR FITNESS FOR A
--     PARTICULAR PURPOSE OF SAID MATERIAL.
--*
-- OBJECTIVE:
--      CHECK THAT CONSTRAINT_ERROR IS RAISED WHEN A
--      PRODUCT LIES OUTSIDE THE RANGE OF THE BASE TYPE, IF THE
--      OPERANDS ARE OF PREDEFINED TYPE LONG_INTEGER.

-- APPLICABILITY CRITERIA:
--      THIS TEST IS APPLICABLE ONLY TO IMPLEMENTATIONS THAT SUPPORT
--      THE PREDEFINED TYPE "LONG_INTEGER".

--      IF SUCH A TYPE IS NOT SUPPORTED THEN THE DECLARATION OF THE
--      VARIABLE "F" MUST BE REJECTED.

-- *** NOTE: This test has been modified since ACVC version 1.11 to    -- 9X
-- ***       remove incompatibilities associated with the transition   -- 9X
-- ***       to Ada 9X.                                                -- 9X

-- HISTORY:
--      RJW 09/01/86  CREATED ORIGINAL TEST.
--      JET 12/30/87  UPDATED HEADER FORMAT AND DEFEATED OPTIMIZATION.
--      JRL 03/30/93  REMOVED NUMERIC_ERROR FROM TEST.

WITH REPORT; USE REPORT;
PROCEDURE C45504C IS

     F : LONG_INTEGER;                --  N/A => ERROR.
     L : LONG_INTEGER;

     FUNCTION IDENT_LONG(A : LONG_INTEGER) RETURN LONG_INTEGER IS
     BEGIN
          IF EQUAL (3, 3) THEN
               RETURN A;
          ELSE
               RETURN 0;
          END IF;
     END IDENT_LONG;

     FUNCTION LONG_OK (X : LONG_INTEGER) RETURN BOOLEAN IS
     BEGIN
          RETURN X = IDENT_LONG(X);
     END;

BEGIN
     TEST ( "C45504C", "CHECK THAT CONSTRAINT_ERROR " &
                       "IS RAISED WHEN A PRODUCT LIES OUTSIDE THE " &
                       "RANGE OF THE BASE TYPE, IF THE OPERANDS ARE " &
                       "OF PREDEFINED TYPE LONG_INTEGER" );

     F := IDENT_LONG(LONG_INTEGER'FIRST);
     L := IDENT_LONG(LONG_INTEGER'LAST);

     BEGIN
          IF LONG_OK (F * L) THEN
               FAILED ( "NO EXCEPTION RAISED BY 'F * L' - 1" );
          ELSE
               FAILED ( "NO EXCEPTION RAISED BY 'F * L' - 2" );
          END IF;

     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               COMMENT ( "CONSTRAINT_ERROR RAISED BY 'F * L'" );
          WHEN OTHERS =>
               FAILED ( "WRONG EXCEPTION RAISED BY 'F * L'" );
     END;

     BEGIN
          IF LONG_OK (F * F) THEN
               FAILED ( "NO EXCEPTION RAISED BY 'F * F' - 1" );
          ELSE
               FAILED ( "NO EXCEPTION RAISED BY 'F * F' - 2" );
          END IF;

     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               COMMENT ( "CONSTRAINT_ERROR RAISED BY 'F * F'" );
          WHEN OTHERS =>
               FAILED ( "WRONG EXCEPTION RAISED BY 'F * F'" );
     END;

     BEGIN
          IF LONG_OK (L * L) THEN
               FAILED ( "NO EXCEPTION RAISED BY 'L * L' - 1" );
          ELSE
               FAILED ( "NO EXCEPTION RAISED BY 'L * L' - 2" );
          END IF;

     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               COMMENT ( "CONSTRAINT_ERROR RAISED BY 'L * L'" );
          WHEN OTHERS =>
               FAILED ( "WRONG EXCEPTION RAISED BY 'L * L'" );
     END;

     RESULT;

END C45504C;
