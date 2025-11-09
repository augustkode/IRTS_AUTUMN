with Shared_Data;          use Shared_Data;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console;     use MicroBit.Console;
with MicroBit;             use MicroBit;
with MicroBit.Ultrasonic;
with MicroBit.Types;       use MicroBit.Types;
with Ada.Real_Time;        use Ada.Real_Time;
with Ada.Exceptions;       use Ada.Exceptions;

package body Motor_Task is
   task body Motor is
      Period        : constant Time_Span := Milliseconds (100);
      Next          : Time := Clock;
      Start, Finish : Time;
      Exec_Time     : Duration;
      Counter       : Integer := 0;
   begin
      loop
         Start := Clock;

         if not Collision_State.Control_Active then
            if Collision_State.Should_Stop then
               Drive (Stop);
            else
               Drive (Forward, (4000, 4000, 4000, 4000));
            end if;
         end if;

         Finish := Clock;
         Exec_Time := To_Duration (Finish - Start);
         Counter := Counter + 1;
         if Counter mod 10 = 0 then
            Put_Line
              ("[MOTOR] Computation time: "
               & Duration'Image (Exec_Time)
               & " s");
         end if;

         Next := Next + Period;
         delay until Next;
      end loop;
   exception
      when others =>
         Put_Line ("[MOTOR] Exception!");
   end Motor;
end Motor_Task;
