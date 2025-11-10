with System; use System;

package Shared_Control_Data is
   type Control_State_Type is (Stop, Forward, Backward, Turn_Left, Turn_Right);

   protected Control_Data
     with Priority => Priority'Last - 1
   is
      procedure Set_State (Value : Control_State_Type);
      function Get_State return Control_State_Type;
   private
      Current_State : Control_State_Type := Stop;
   end Control_Data;
end Shared_Control_Data;
