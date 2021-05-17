-- B83030D.ADA

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
--     CHECK THAT IF A SUBPROGRAM DECLARED OUTSIDE A GENERIC UNIT
--     IS HIDDEN, A USE OF THE COMMON IDENTIFIER, WITHIN THE
--     GENERIC SUBPROGRAM, WHICH WOULD BE LEGAL TO THE OUTER
--     DECLARATION MUST BE REJECTED IF IT IS ILLEGAL AS A REFERENCE TO
--     THE GENERIC SUBPROGRAM.  THIS TEST CHECKS THE CASE IN WHICH THE
--     GENERIC SUBPROGRAM BODY COMPILED AS A SUBUNIT IN THE SAME
--     COMPILATION.

-- HISTORY:
--     RJW 11/06/88  CREATED ORIGINAL TEST.

PACKAGE B83030D_DECL1 IS

     GENERIC
          A : INTEGER;
     PROCEDURE B83030D_PROC1 (X, Y, Z : INTEGER);

     GENERIC
     FUNCTION B83030D_PROC2 (F : FLOAT) RETURN FLOAT;

     GENERIC
          TYPE T IS PRIVATE;
     PROCEDURE B83030D_FUNC3 (B : BOOLEAN);

     GENERIC
          WITH PROCEDURE P (X, Y : INTEGER);
     FUNCTION B83030D_FUNC4 RETURN BOOLEAN;
END B83030D_DECL1;
