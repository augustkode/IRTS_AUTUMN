with System; use System;

package Controller_Task is
   task Controller
     with Priority => System.Priority'Last - 2;
end Controller_Task;
