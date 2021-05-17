-- BC3405E.ADA

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
-- CHECK THAT THE COMPONENT TYPE OF A GENERIC FORMAL TYPE AND THE ACTUAL
-- ARRAY TYPE MUST BE EITHER CONSTRAINED OR UNCONSTRAINED.

-- CHECK WHEN THE COMPONENT TYPE IS AN ACCESS TYPE DESIGNATING OBJECTS
-- OF AN ARRAY TYPE OR OF A TYPE WITH DISCRIMINANTS.

-- CHECK WHEN THE COMPONENT TYPE IS A GENERIC FORMAL PARAMETER DECLARED
-- IN THE SAME FORMAL PART AS THE ARRAY TYPE.

-- SPS 6/28/82
-- JBG 3/9/83

PROCEDURE BC3405E IS

     TYPE REC (D: INTEGER := 3) IS RECORD NULL; END RECORD;
     SUBTYPE CREC IS REC(D => 3);

     SUBTYPE CST IS STRING (1..3);

     PACKAGE PRIV IS
          TYPE PV (D: INTEGER) IS PRIVATE;
          TYPE LP (D: INTEGER := 3) IS LIMITED PRIVATE;
     PRIVATE
          TYPE PV (D: INTEGER) IS RECORD NULL; END RECORD;
          TYPE LP (D: INTEGER := 3) IS RECORD NULL; END RECORD;
     END PRIV;
     USE PRIV;
     
     SUBTYPE CPV IS PV(D => 3);
     SUBTYPE CLP IS LP(D => 3);

     TYPE AST IS ACCESS STRING;
     TYPE ACST IS ACCESS CST;
     SUBTYPE ASTC IS AST(1..3);

     TYPE AREC IS ACCESS REC;
     TYPE ACREC IS ACCESS CREC;
     SUBTYPE ARECC IS AREC(D => 3);

     TYPE APV IS ACCESS PV;
     TYPE ACPV IS ACCESS CPV;
     SUBTYPE APVC IS APV(D => 3);

     TYPE ALP IS ACCESS LP;
     TYPE ACLP IS ACCESS CLP;
     SUBTYPE ALPC IS ALP(D => 3);
     SUBTYPE NATURAL IS INTEGER RANGE 1..INTEGER'LAST;

     TYPE AR_AST   IS ARRAY (NATURAL) OF AST;
     TYPE AR_ACST  IS ARRAY (NATURAL) OF ACST;
     TYPE AR_ASTC  IS ARRAY (NATURAL) OF ASTC;
     TYPE AR_AREC  IS ARRAY (NATURAL) OF AREC;
     TYPE AR_ACREC IS ARRAY (NATURAL) OF ACREC;
     TYPE AR_ARECC IS ARRAY (NATURAL) OF ARECC;
     TYPE AR_APV   IS ARRAY (NATURAL) OF APV;
     TYPE AR_ACPV  IS ARRAY (NATURAL) OF ACPV;
     TYPE AR_APVC  IS ARRAY (NATURAL) OF APVC;
     TYPE AR_ALP   IS ARRAY (NATURAL) OF ALP;
     TYPE AR_ACLP  IS ARRAY (NATURAL) OF ACLP;
     TYPE AR_ALPC  IS ARRAY (NATURAL) OF ALPC;

     GENERIC
          TYPE T IS PRIVATE;
          TYPE FT IS ARRAY (NATURAL) OF T;
     PACKAGE P IS END P;

     PACKAGE PAST1 IS NEW P (AST, AR_AST);       -- OK.
     PACKAGE PAST2 IS NEW P (ASTC, AR_AST);      -- ERROR: AR_AST.
     PACKAGE PAST3 IS NEW P (AST, AR_ASTC);      -- ERROR: AR_ASTC.
     PACKAGE PAST4 IS NEW P (ASTC, AR_ASTC);     -- OK.

     PACKAGE PACST1 IS NEW P (ACST, AR_ACST);    -- OK.

     PACKAGE PAREC1 IS NEW P (AREC, AR_AREC);    -- OK.
     PACKAGE PAREC2 IS NEW P (ARECC, AR_AREC);   -- ERROR: AR_AREC.
     PACKAGE PAREC3 IS NEW P (AREC, AR_ARECC);   -- ERROR: AR_ARECC.
     PACKAGE PAREC4 IS NEW P (ARECC, AR_ARECC);  -- OK.

     PACKAGE PACREC1 IS NEW P (ACREC, AR_ACREC); -- OK.

     PACKAGE PAPV1 IS NEW P (APV, AR_APV);       -- OK.
     PACKAGE PAPV2 IS NEW P (APVC, AR_APV);      -- ERROR: AR_APV.
     PACKAGE PAPV3 IS NEW P (APV, AR_APVC);      -- ERROR: AR_APVC.
     PACKAGE PAPV4 IS NEW P (APVC, AR_APVC);     -- OK.

     PACKAGE PACPV1 IS NEW P (ACPV, AR_ACPV);    -- OK.

     PACKAGE PALP1 IS NEW P (ALP, AR_ALP);       -- OK.
     PACKAGE PALP2 IS NEW P (ALPC, AR_ALP);      -- ERROR: AR_ALP.
     PACKAGE PALP3 IS NEW P (ALP, AR_ALPC);      -- ERROR: AR_ALPC.
     PACKAGE PALP4 IS NEW P (ALPC, AR_ALPC);     -- OK.

     PACKAGE PACLP1 IS NEW P (ACLP, AR_ACLP);    -- OK.

BEGIN
     NULL;
END BC3405E;
