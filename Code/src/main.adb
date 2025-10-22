--with MicroBit.Console; use MicroBit.Console;
--with Sensor_Task; use Sensor_Task;

--procedure Main is
--begin
--   Put_Line ("[MAIN] Måler WCET for Sensor_Task...");
--   Measure_C;

--   loop
--      delay 1.0;
--   end loop;
--end Main;

--with Motor_Task;       use Motor_Task;
--with MicroBit.Console; use MicroBit.Console;

--procedure Main is
--begin
--   Put_Line ("[MAIN] Måler WCET for Motor_Task...");
--   Measure_C;

--   loop
--      delay 1.0;
--   end loop;
--end Main;

--with Controller_Task;
--with MicroBit.Console; use MicroBit.Console;

--procedure Main is
--begin
--   Put_Line ("[MAIN] Måler WCET for Controller_Task...");
--   Controller_Task.Measure_C;

--   loop
--      delay 1.0;
--   end loop;
--end Main;

with Sensor_Task; use Sensor_Task;
with MicroBit.Console; use MicroBit.Console;

procedure Main is
begin
   Put_Line ("[MAIN] Måler release jitter for Sensor_Task...");
   Measure_Jitter;

   loop
      delay 1.0;
   end loop;
end Main;
