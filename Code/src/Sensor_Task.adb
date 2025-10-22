with MicroBit;              use MicroBit;
with MicroBit.Ultrasonic;
with MicroBit.Types;        use MicroBit.Types;
with MicroBit.Console;      use MicroBit.Console;
with Shared_Data;           use Shared_Data;

package body Sensor_Task is
   task body Sensor is
      package SensorL is new MicroBit.Ultrasonic (MB_P15, MB_P1);
      package SensorR is new MicroBit.Ultrasonic (MB_P14, MB_P0);

      Distance_L, Distance_R : Distance_cm := 0;
      Threshold : constant Distance_cm := 20;

   begin
      loop
         Distance_L := SensorL.Read;
         Distance_R := SensorR.Read;

         Put_Line
           ("L=" & Distance_cm'Image (Distance_L) &
            "cm  R=" & Distance_cm'Image (Distance_R) & "cm");

         -- enkel hysterese for å unngå flimring
         if Distance_L < Threshold or else Distance_R < Threshold then
             Collision_State.Set_Stop (True);
         else
            Collision_State.Set_Stop (False);
         end if;


         delay 0.015;
      end loop;
   end Sensor;
end Sensor_Task;
