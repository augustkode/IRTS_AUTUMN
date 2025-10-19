with System; use System;

package Shared_Data is
   protected Collision_State
     with Priority => Priority'Last
   is
      -- Sensor -> Controller/Motor
      procedure Set_Stop (Value : Boolean);
      function Should_Stop return Boolean;

      -- Controller -> Motor
      procedure Set_Control (Active : Boolean);
      function Control_Active return Boolean;
   private
      Stop_Now        : Boolean := False;
      Controller_Owns : Boolean := False;
   end Collision_State;
end Shared_Data;
