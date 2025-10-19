package body Shared_Data is

   protected body Collision_State is

      procedure Set_Stop (Value : Boolean) is
      begin
         Stop_Now := Value;
      end Set_Stop;

      function Should_Stop return Boolean is
      begin
         return Stop_Now;
      end Should_Stop;

      procedure Set_Control (Active : Boolean) is
      begin
         Controller_Owns := Active;
      end Set_Control;

      function Control_Active return Boolean is
      begin
         return Controller_Owns;
      end Control_Active;

   end Collision_State;

end Shared_Data;
