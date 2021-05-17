
     --=================================================================--

with B392002_0;
package B392002_1 is
   -- Parameter types are declared in B392002_0.
   procedure Primitive_Of_Neither
             (P1 : B392002_0.Tagged_Of_Pk0_T;
              P2 : B392002_0.Tagged_Of_Pk0_R);                -- OK. {2:4;1}
   function Primitive_Of_Neither_Func (P1 : B392002_0.New_Tagged_Of_Pk0_T1)
     return B392002_0.New_Tagged_Of_Pk0_T2;                   -- OK. {1:4;1}
   -------------------------------------------------------------

   type New_Tagged_Of_Pk1_T1 is new B392002_0.New_Tagged_Of_Pk0_T1 with
     record
        Pk1_Data2 : Float;
     end record;

   type New_Tagged_Of_Pk1_T2 is new B392002_0.New_Tagged_Of_Pk0_T1 with
     record
        Pk1_Comp2 : Integer;
     end record;

   type Tagged_Of_Pk1_U is tagged record
      Pk1_Dat  : Boolean;
   end record;

   type Tagged_Of_Pk1_S is tagged record
      Pk1_Comp : Integer;
   end record;

   -- Type of one parameter declared in B392002_0.
   procedure Primitive_Of_One_Proc1
             (P1 : B392002_0.Tagged_Of_Pk0_T;
              P2 : Tagged_Of_Pk1_S);                          -- OK. {2:4;1}
   procedure Primitive_Of_One_Proc2
             (P1 : B392002_0.Tagged_Of_Pk0_T;
              P2 : New_Tagged_Of_Pk1_T1);                     -- OK. {2:4;1}
   function Primitive_Of_One_Func1 (P1 : Tagged_Of_Pk1_U)
     return B392002_0.Tagged_Of_Pk0_R;                        -- OK. {1:4;1}
   function Primitive_Of_One_Func2 (P1 : B392002_0.New_Tagged_Of_Pk0_T1)
     return New_Tagged_Of_Pk1_T1;                             -- OK. {1:4;1}

   -- Parameter types are declared in this package.
   procedure Same_Type_Of_Both_Proc1
             (P1 : New_Tagged_Of_Pk1_T1;
              P2 : New_Tagged_Of_Pk1_T1);                     -- OK. {2:4;1}

   -- Parameter types are declared in B392002_0.
   function Same_Type_Of_Both_Func (P1 : B392002_0.Tagged_Of_Pk0_T)
     return B392002_0.Tagged_Of_Pk0_T;                        -- OK. {1:4;1}
   -------------------------------------------------------------

   -- Types for both parameters declared in this package.
   procedure Primitive_Of_Both_Proc1
             (P1 : Tagged_Of_Pk1_U;
              P2 : Tagged_Of_Pk1_S);                          -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.
   procedure Primitive_Of_Both_Proc2
             (P1 : New_Tagged_Of_Pk1_T1;
              P2 : New_Tagged_Of_Pk1_T2);                     -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.
   function Primitive_Of_Both_Func1 (P1 : Tagged_Of_Pk1_U)
     return New_Tagged_Of_Pk1_T2;                             -- ERROR: {1:4;1}
                      -- Primitive operation for two different tagged types.
   -------------------------------------------------------------
   type Tagged_Of_Pk1_Q is tagged record
      Pk1_Dat : Boolean;
   end record;

   -- Type descendents
   type New_Tagged_Of_Pk1_Q1 is new Tagged_Of_Pk1_Q with private;
   type New_Tagged_Of_Pk1_Q2 is new Tagged_Of_Pk1_Q with private;

   -- Types for both parameters declared in this package.
   procedure Primitive_Of_Both_Proc3
             (P1 : Tagged_Of_Pk1_Q;
              P2 : New_Tagged_Of_Pk1_Q1);                     -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.
   procedure Primitive_Of_Both_Proc4
             (P1 : New_Tagged_Of_Pk1_Q1;
              P2 : New_Tagged_Of_Pk1_Q2);                     -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.
   function Primitive_Of_Both_Func2 (P1 : Tagged_Of_Pk1_Q)
     return New_Tagged_Of_Pk1_Q1;                             -- ERROR: {1:4;1}
                      -- Primitive operation for two different tagged types.
   function Primitive_Of_Both_Func3 (P1 : New_Tagged_Of_Pk1_Q1)
     return New_Tagged_Of_Pk1_Q2;                             -- ERROR: {1:4;1}
                      -- Primitive operation for two different tagged types.
   -------------------------------------------------------------
   type Tagged_Private_Of_Pk1 is tagged private;

   procedure Same_Type_Of_Both_Proc2
             (P1, P2 : Tagged_Private_Of_Pk1);                -- OK. {1:4;1}
   procedure Primitive_Of_Both_Proc5
             (P1 : Tagged_Private_Of_Pk1;
              P2 : Tagged_Of_Pk1_Q);                          -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.
   -------------------------------------------------------------
   type Private_Tagged_Of_Pk1 is private;

   procedure Same_Type_Of_Both_Proc3
             (P1, P2 : Private_Tagged_Of_Pk1);                -- OK. {1:4;1}
   procedure Same_Type_Of_Both_Proc4
             (P1 : Private_Tagged_Of_Pk1;
              P2 : Tagged_Private_Of_Pk1);    -- POSSIBLE ERROR: [Set1] {2:4;1}
                      -- Primitive operation for two different tagged types.

   type Private_Tagged_Of_Pk1_Again is private;

   procedure Same_Type_Of_Both_Proc5
             (P1 : Private_Tagged_Of_Pk1_Again;
              P2 : Tagged_Of_Pk1_Q);          -- POSSIBLE ERROR: [Set2] {2:4;1}
                      -- Primitive operation for two different tagged types.

private
   type New_Tagged_Of_Pk1_Q2 is new Tagged_Of_Pk1_Q with
     record
        New_Data : Float;
     end record;

   type New_Tagged_Of_Pk1_Q1 is new Tagged_Of_Pk1_Q with
     record
        New_Data : Integer;
     end record;

   procedure Private_Primitive_Of_Both_Proc1
             (P1 : New_Tagged_Of_Pk1_Q1;
              P2 : Tagged_Of_Pk1_S);                          -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.
   -------------------------------------------------------------
   type Tagged_Of_Pk1_V is tagged record
      Data : Integer;
   end record;

   type Tagged_Of_Pk1_W is tagged record
      Comp : Float;
   end record;

   procedure Private_Primitive_Of_Both_Proc2
             (P1 : Tagged_Of_Pk1_V;
              P2 : Tagged_Of_Pk1_W);                          -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.

   -------------------------------------------------------------
   type Tagged_Private_Of_Pk1 is tagged
     record
        Field_1 : Boolean;
     end record;
   type Private_Tagged_Of_Pk1 is tagged
     record           -- Primitive operation for two different tagged types:
                      -- Same_Type_Of_Both_Proc4
        Field_1 : Tagged_Private_Of_Pk1;
     end record;                              -- POSSIBLE ERROR: [Set1] {4:4;1}

   procedure Private_Primitive_Of_Both_Proc3
             (P1 : Tagged_Private_Of_Pk1;
              P2 : Private_Tagged_Of_Pk1);                    -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.
   procedure Private_Primitive_Of_Both_Proc4
             (P1 : Private_Tagged_Of_Pk1;
              P2 : Tagged_Of_Pk1_Q);                          -- ERROR: {2:4;1}
                      -- Primitive operation for two different tagged types.

   type Private_Tagged_Of_Pk1_Again is tagged
     record           -- Primitive operation for two different tagged types:
                      -- Same_Type_Of_Both_Proc5
        Field_1 : Tagged_Private_Of_Pk1;
     end record;                              -- POSSIBLE ERROR: [Set2] {4:4;1}


end B392002_1;
