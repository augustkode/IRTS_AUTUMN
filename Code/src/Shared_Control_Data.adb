with Shared_Control_Data;

package body Shared_Control_Data is
   protected body Control_Data is
      procedure Set_State (Value : Control_State_Type) is
      begin
         Current_State := Value;
      end Set_State;

      function Get_State return Control_State_Type is
      begin
         return Current_State;
      end Get_State;
   end Control_Data;
end Shared_Control_Data;
