with Ada.Real_Time;   use Ada.Real_Time;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console; use MicroBit.Console;
with Shared_Data; use Shared_Data;

package body Motor_Task is

   ---------------------------------------------------------
   --  Prosedyre for å måle Worst-Case Execution Time (C)
   ---------------------------------------------------------
   procedure Measure_C is
      Start, Finish : Time;
      Worst         : Time_Span := To_Time_Span (0.0);
   begin
      for I in 1 .. 500 loop
         Start := Clock;

         -- === Målbart arbeid ===
         if Collision_State.Control_Active then
            null;
         elsif Collision_State.Should_Stop then
            Drive (Stop);
         else
            Drive (Forward, (3000, 3000, 3000, 3000));
         end if;
         -- ======================

         Finish := Clock;

         if Finish - Start > Worst then
            Worst := Finish - Start;
         end if;

         delay 0.01;  -- pust mellom rundene
      end loop;

      Put_Line ("Motor C = " &
        Duration'Image (To_Duration (Worst) * 1000.0) & " ms");
   end Measure_C;

   ---------------------------------------------------------
   --  Vanlig Motor-task (tom mens vi måler)
   ---------------------------------------------------------
   task body Motor is
   begin
      null;  -- holdes inaktiv mens vi måler
   end Motor;

end Motor_Task;
