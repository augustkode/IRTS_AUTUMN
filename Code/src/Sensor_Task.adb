with Shared_Sensor_Data;   use Shared_Sensor_Data;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console;     use MicroBit.Console;
with MicroBit;             use MicroBit;
with MicroBit.Ultrasonic;
with MicroBit.Types;       use MicroBit.Types;
with Ada.Real_Time;        use Ada.Real_Time;
with Ada.Exceptions;       use Ada.Exceptions;

package body Sensor_Task is
   task body Sensor is
      Period        : constant Time_Span := Milliseconds (50);
      Next          : Time := Clock;
      Start, Finish : Time;

      package SensorL is new MicroBit.Ultrasonic (MB_P15, MB_P1);
      package SensorR is new MicroBit.Ultrasonic (MB_P14, MB_P0);

      Distance_L, Distance_R : Distance_cm := 0;
   begin
      loop
         Start := Clock;

         Distance_L := SensorL.Read;
         Distance_R := SensorR.Read;

         Sensor_Data.Set_Distance_L (Distance_L);
         Sensor_Data.Set_Distance_R (Distance_R);

         Next := Next + Period;
         delay until Next;
      end loop;
   exception
      when others =>
         Put_Line ("[SENSOR] Other crazy Exception!");

   end Sensor;
end Sensor_Task;
