--with Ada.Real_Time;   use Ada.Real_Time;
--with MicroBit;        use MicroBit;
--with MicroBit.Ultrasonic;
--with MicroBit.Types;  use MicroBit.Types;
--with MicroBit.Console;use MicroBit.Console;
--with Shared_Data;     use Shared_Data;

--package body Sensor_Task is

--   package SensorL is new MicroBit.Ultrasonic (MB_P15, MB_P1);
--   package SensorR is new MicroBit.Ultrasonic (MB_P14, MB_P0);

--   Distance_L, Distance_R : Distance_cm := 0;
--   Threshold : constant Distance_cm := 15;


--   procedure Measure_C is
--      Start, Finish : Time;
--      Worst         : Time_Span := To_Time_Span (0.0);
--   begin
--      for I in 1 .. 500 loop
--         Start := Clock;

--         Distance_L := SensorL.Read;
--         Distance_R := SensorR.Read;
--         Collision_State.Set_Stop
--           (Distance_L < Threshold or else Distance_R < Threshold);

--         Finish := Clock;

--         if Finish - Start > Worst then
--            Worst := Finish - Start;
--         end if;

--         delay 0.02;
--      end loop;

--      Put_Line ("Sensor C = " &
--                Duration'Image (To_Duration (Worst) * 1000.0) & " ms");
--   end Measure_C;

--   task body Sensor is
--   begin
--      null;
--   end Sensor;

--end Sensor_Task;

with Ada.Real_Time;   use Ada.Real_Time;
with MicroBit;        use MicroBit;
with MicroBit.Ultrasonic;
with MicroBit.Types;  use MicroBit.Types;
with MicroBit.Console;use MicroBit.Console;

package body Sensor_Task is

   package SensorL is new MicroBit.Ultrasonic (MB_P15, MB_P1);
   package SensorR is new MicroBit.Ultrasonic (MB_P14, MB_P0);

   -------------------------------
   -- Måling av release jitter  --
   -------------------------------
   procedure Measure_Jitter is
      Period       : constant Time_Span := Milliseconds (25);  -- ønsket periode (50 ms)
      Expected_Next, Now : Time;
      Jitter, Max_Jitter : Time_Span := To_Time_Span (0.0);
   begin
      Put_Line ("[JITTER] Starter måling (50 ms periode, 200 sykluser)");

      Expected_Next := Clock;

      for I in 1 .. 200 loop
         -- vent til neste forventede tid
         delay until Expected_Next;

         Now := Clock;
         Jitter := abs (Now - Expected_Next);

         if Jitter > Max_Jitter then
            Max_Jitter := Jitter;
         end if;

         -- (valgfritt: gjør litt ekte arbeid her)
         null;

         Expected_Next := Expected_Next + Period;
      end loop;

      Put_Line ("Max release jitter = " &
                Duration'Image (To_Duration (Max_Jitter) * 1000.0) & " ms");
   end Measure_Jitter;

   -------------------------------
   task body Sensor is
   begin
      null;
   end Sensor;

end Sensor_Task;
