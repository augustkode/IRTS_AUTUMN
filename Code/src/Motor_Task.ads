with System; use System;

package Motor_Task is
   -- Motor-tasken kjører lavest (mest bakgrunn)
   task Motor
     with Priority => System.Priority'Last - 3;

   -- Måleprosedyre for computation time (C)
   procedure Measure_C;
end Motor_Task;
