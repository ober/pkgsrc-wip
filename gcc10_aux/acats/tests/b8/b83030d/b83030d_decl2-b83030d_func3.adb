
SEPARATE (B83030D_DECL2)
FUNCTION B83030D_FUNC3 RETURN INTEGER IS
     PROCEDURE FUNC3 IS NEW B83030D_FUNC3 (INTEGER);       -- ERROR:
BEGIN
     RETURN 3;
END B83030D_FUNC3;
