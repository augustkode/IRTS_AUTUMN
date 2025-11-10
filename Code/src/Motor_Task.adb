with Shared_Control_Data;  use Shared_Control_Data;
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
         case Control_Data.Get_State is
            when turn_left  =>
               Drive (Yaw_Left, (4000, 4000, 4000, 4000));

            when turn_right =>
               Drive (Yaw_Right, (4000, 4000, 4000, 4000));

            when forward    =>
               Drive (Forward, (4000, 4000, 4000, 4000));

            when Stop       =>
               Drive (Stop);

            when others     =>
               raise Constraint_Error with "Unknown State_Type value";
         end case;

         Next := Next + Period;
         delay until Next;
      end loop;
   exception
      when others =>
         Put_Line ("[MOTOR] Exception!");
   end Motor;
end Motor_Task;
