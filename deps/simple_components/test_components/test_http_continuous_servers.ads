--                                                                    --
--  package                         Copyright (c)  Dmitry A. Kazakov  --
--     Test_HTTP_Continuous_Server                 Luebeck            --
--  Interface                                      Winter, 2015       --
--                                                                    --
--                                Last revision :  23:22 29 Sep 2017  --
--                                                                    --
--  This  library  is  free software; you can redistribute it and/or  --
--  modify it under the terms of the GNU General Public  License  as  --
--  published by the Free Software Foundation; either version  2  of  --
--  the License, or (at your option) any later version. This library  --
--  is distributed in the hope that it will be useful,  but  WITHOUT  --
--  ANY   WARRANTY;   without   even   the   implied   warranty   of  --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU  --
--  General  Public  License  for  more  details.  You  should  have  --
--  received  a  copy  of  the GNU General Public License along with  --
--  this library; if not, write to  the  Free  Software  Foundation,  --
--  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.    --
--                                                                    --
--  As a special exception, if other files instantiate generics from  --
--  this unit, or you link this unit with other files to produce  an  --
--  executable, this unit does not by  itself  cause  the  resulting  --
--  executable to be covered by the GNU General Public License. This  --
--  exception  does not however invalidate any other reasons why the  --
--  executable file might be covered by the GNU Public License.       --
--____________________________________________________________________--

with Ada.Exceptions;         use Ada.Exceptions;
with Ada.Streams;            use Ada.Streams;
with Ada.Streams.Stream_IO;  use Ada.Streams.Stream_IO;
with GNAT.Sockets;           use GNAT.Sockets;
with GNAT.Sockets.Server;    use GNAT.Sockets.Server;

with GNAT.Sockets.Connection_State_Machine.HTTP_Server;
use  GNAT.Sockets.Connection_State_Machine.HTTP_Server;

package Test_HTTP_Continuous_Servers is
   Max_File_Path : constant := 4*1024;

   type Test_HTTP_Factory
        (  Request_Length  : Positive;
           Input_Size      : Buffer_Length;
           Output_Size     : Buffer_Length;
           Max_Connections : Positive
        )  is new Connections_Factory with private;
   function Create
            (  Factory  : access Test_HTTP_Factory;
               Listener : access Connections_Server'Class;
               From     : Sock_Addr_Type
            )  return Connection_Ptr;
   function Get_IO_Timeout (Factory : Test_HTTP_Factory)
      return Duration;
   type Test_Client
        (  Listener       : access Connections_Server'Class;
           Request_Length : Positive;
           Input_Size     : Buffer_Length;
           Output_Size    : Buffer_Length
        )  is new HTTP_Client with private;
   procedure Do_Get  (Client : in out Test_Client);
   procedure Do_Head (Client : in out Test_Client);

private
   type Test_HTTP_Factory
        (  Request_Length  : Positive;
           Input_Size      : Buffer_Length;
           Output_Size     : Buffer_Length;
           Max_Connections : Positive
        )  is new Connections_Factory with null record;

   task type Content_Generator (Client : access Test_Client) is
      entry Stop;
   end Content_Generator;
   type Content_Generator_Ptr is access Content_Generator;
   type Infinite_Content (Client : access Test_Client) is
      new Content_Source with
   record
      State     : Natural := 0;
      Ready     : Boolean := False;
      Generator : Content_Generator_Ptr;
      pragma Atomic (Ready);
   end record;
   function Get (Source : access Infinite_Content) return String;
   procedure Initialize (Source : in out Infinite_Content);
   procedure Write
             (  Stream : access Root_Stream_Type'Class;
                Item   : Infinite_Content
             );
   for Infinite_Content'Write use Write;

   type Test_Client
        (  Listener        : access Connections_Server'Class;
           Request_Length  : Positive;
           Input_Size      : Buffer_Length;
           Output_Size     : Buffer_Length
        )  is new HTTP_Client
                  (  Listener       => Listener,
                     Request_Length => Request_Length,
                     Input_Size     => Input_Size,
                     Output_Size    => Output_Size
                  )  with
   record
      Content : aliased Infinite_Content (Test_Client'Unchecked_Access);
   end record;
   procedure Finalize (Client : in out Test_Client);

   procedure Do_Get_Head (Client : in out Test_Client; Get : Boolean);

end Test_HTTP_Continuous_Servers;
