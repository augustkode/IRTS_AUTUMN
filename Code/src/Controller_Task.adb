with Shared_Control_Data;  use Shared_Control_Data;
with Shared_Sensor_Data;   use Shared_Sensor_Data;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console;     use MicroBit.Console;
with HAL;                  use HAL;
with Ada.Exceptions;       use Ada.Exceptions;
with Ada.Real_Time;        use Ada.Real_Time;
with MicroBit.Types;       use MicroBit.Types;

package body Controller_Task is
   task body Controller is
      Period                : constant Time_Span := Milliseconds (50);
      Next                  : Time := Clock;
      Start, Finish         : Time;
      Rotating              : Boolean := False;
      Threshold             : constant Distance_cm := 20;
      Dist_Left, Dist_Right : Distance_cm := 0;
   begin
      loop
         Dist_Left := Sensor_Data.Get_Distance_L;
         Dist_Right := Sensor_Data.Get_Distance_R;

         if Dist_Left < Threshold and then Dist_Left < Dist_Right then
            Control_Data.Set_State (Turn_Right);
         elsif Dist_Right < Threshold and then Dist_Right < Dist_Left then
            Control_Data.Set_State (Turn_Left);
         else
            Control_Data.Set_State (Forward);
         end if;

         Next := Next + Period;
         delay until Next;
      end loop;
   exception
      when others =>
         Put_Line ("[CTRL] Exception in controller task");
   end Controller;

end Controller_Task;
