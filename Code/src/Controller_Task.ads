with System; use System;

package Controller_Task is
   task Controller
     with Priority => System.Priority'Last - 2;

   procedure Measure_C;
end Controller_Task;
