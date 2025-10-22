with Ada.Real_Time;           use Ada.Real_Time;
with MicroBit.MotorDriver;    use MicroBit.MotorDriver;
with MicroBit.Console;        use MicroBit.Console;
with Shared_Data;             use Shared_Data;
with HAL;                     use HAL;

package body Controller_Task is

   -- WCET-måling for controller
   procedure Measure_C is
      Start, Finish : Time;
      Worst         : Time_Span := To_Time_Span (0.0);
      Dummy         : Boolean;
   begin
      for I in 1 .. 500 loop
         Start := Clock;

         -- === kjernearbeid som controller utfører ===
         if Collision_State.Should_Stop and not Collision_State.Control_Active then
            Collision_State.Set_Control (True);
            Drive (Yaw_Left, (UInt12(3000), UInt12(3000), UInt12(3000), UInt12(3000)));
            Drive (Stop);
            Collision_State.Set_Control (False);
         else
            -- minimal lesesti (unngå ubrukte-resultat-advarsel)
            Dummy := Collision_State.Control_Active;
         end if;
         -- ===========================================

         Finish := Clock;

         if Finish - Start > Worst then
            Worst := Finish - Start;
         end if;

         delay 0.01;  -- pusterom mellom målinger
      end loop;

      Put_Line ("Controller C = " &
                Duration'Image (To_Duration (Worst) * 1000.0) & " ms");
   end Measure_C;

   task body Controller is
   begin
      null;  -- hold inaktiv mens du måler
   end Controller;

end Controller_Task;
