with Shared_Data;          use Shared_Data;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console;     use MicroBit.Console;
with MicroBit;             use MicroBit;
with MicroBit.Ultrasonic;
with MicroBit.Types;       use MicroBit.Types;
with Ada.Real_Time;        use Ada.Real_Time;
with Ada.Exceptions;       use Ada.Exceptions;

package body Sensor_Task is
   task body Sensor is
      Period        : constant Time_Span := Milliseconds (150);
      Next          : Time := Clock;
      Start, Finish : Time;

      package SensorL is new MicroBit.Ultrasonic (MB_P15, MB_P1);
      package SensorR is new MicroBit.Ultrasonic (MB_P14, MB_P0);
      Distance_L, Distance_R : Distance_cm := 0;
      Threshold              : constant Distance_cm := 20;
   begin
      loop
         Start := Clock;

         Distance_L := SensorL.Read;
         Distance_R := SensorR.Read;

         if Distance_L < Threshold or else Distance_R < Threshold then
            Collision_State.Set_Stop (True);
         else
            Collision_State.Set_Stop (False);
         end if;


         Next := Next + Period;
         delay until Next;
      end loop;
   exception
      when others =>
         Put_Line ("[SENSOR] Exception!");
   end Sensor;
end Sensor_Task;
