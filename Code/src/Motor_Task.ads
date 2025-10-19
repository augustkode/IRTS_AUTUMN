with System; use System;

package Motor_Task is
   task Motor
     with Priority => System.Priority'Last - 3;
end Motor_Task;
