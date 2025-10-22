--with System; use System;

--package Sensor_Task is
--   task Sensor
--     with Priority => System.Priority'Last - 1;

--   procedure Measure_C;
--end Sensor_Task;

with System; use System;

package Sensor_Task is
   task Sensor
     with Priority => System.Priority'Last - 1;

   procedure Measure_Jitter;
end Sensor_Task;
