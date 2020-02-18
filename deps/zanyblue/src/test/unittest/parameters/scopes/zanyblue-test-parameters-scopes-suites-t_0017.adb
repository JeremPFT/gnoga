--
--  ZanyBlue, an Ada library and framework for finite element analysis.
--
--  Copyright (c) 2012, 2016, Michael Rohan <mrohan@zanyblue.com>
--  All rights reserved.
--
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--
--    * Redistributions of source code must retain the above copyright
--      notice, this list of conditions and the following disclaimer.
--
--    * Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
--
--    * Neither the name of ZanyBlue nor the names of its contributors may
--      be used to endorse or promote products derived from this software
--      without specific prior written permission.
--
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
--  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
--  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
--  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
--  HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
--  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
--  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
--  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
--  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
--  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--

separate (ZanyBlue.Test.Parameters.Scopes.Suites)
procedure T_0017 (T : in out Test_Case'Class) is

   Scope : Parameter_Stack_Type;

begin
   Scope.New_Scope;
   WAssert (T, not Scope.Is_Defined ("i"), "'i' should not be defined");
   Scope.Set_Integer ("i", 10);
   WAssert (T, Scope.Get_Integer ("i") = 10, "'i' should be 10");
   Scope.New_Scope;
   Scope.Set_Integer ("i", 11);
   WAssert (T, Scope.Get_Integer ("i") = 11, "'i' should be 11");
   Scope.Increment ("i", Deep => True);
   WAssert (T, Scope.Get_Integer ("i") = 12, "'i' should be 12");
   Scope.Increment ("i", By_Amount => 3, Deep => True);
   WAssert (T, Scope.Get_Integer ("i") = 15, "'i' should be 15");
   Scope.End_Scope;
   WAssert (T, Scope.Get_Integer ("i") = 14, "'i' should be 14");
end T_0017;
