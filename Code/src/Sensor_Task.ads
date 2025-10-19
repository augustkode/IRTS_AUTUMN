with System; use System;

package Sensor_Task is
   task Sensor
     with Priority => System.Priority'Last - 1;
end Sensor_Task;
