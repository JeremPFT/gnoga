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

separate (ZanyBlue.Test.Text.Catalogs.Suites)
procedure T_0010 (T : in out Test_Case'Class) is

   Locale      : constant Locale_Type := Make_Locale ("en_US");
   Catalog     : Catalog_Type;

   procedure Check_Extra_Indexes;
   procedure Check_Extra_Indexes is
   begin
      WAssert (T, Get_Key (Catalog, 4) = "nosuchkey", "Exception not raised!");
   exception
   when No_Such_Key_Error =>
      WAssert (T, True, "Exception raised");
   end Check_Extra_Indexes;

begin
   Catalog := Create;
   Use_Single_Pool (Catalog);
   WAssert (T, Number_Of_Facilities (Catalog) = 0, "Expected 0 facility");
   Add (Catalog, "myfac1", "mykey1", "My Message", Locale);
   WAssert (T, Get_Key (Catalog, 1) = "mykey1", "Expected key name mykey1");
   Add (Catalog, "myfac1", "mykey2", "My Message", Locale);
   WAssert (T, Get_Key (Catalog, 2) = "mykey2", "Expected key name mykey2");
   Add (Catalog, "myfac2", "mykey3", "My Message", Locale);
   WAssert (T, Get_Key (Catalog, 3) = "mykey3", "Expected key name mykey3");
   Check_Extra_Indexes;
end T_0010;
