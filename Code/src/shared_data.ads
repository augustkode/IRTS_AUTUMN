with System; use System;

package Shared_Data is
   type State_Type is
     (turn_left, turn_right, left, right, forward, backward, idle);
   protected Collision_State
     with Priority => Priority'Last - 1 -- ceiling priority
   is
      -- Sensor -> Controller/Motor
      procedure Set_Stop (Value : Boolean);
      function Should_Stop return Boolean;

      -- Controller -> Motor
      procedure Set_Control (Active : Boolean);
      function Control_Active return Boolean;
      procedure Set_State (State : State_Type);
      function Get_State return State_Type;
   private
      Stop_Now        : Boolean := False;
      Controller_Owns : Boolean := False;
      current_state   : State_Type := idle;
   end Collision_State;
end Shared_Data;
