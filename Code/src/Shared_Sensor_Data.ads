with System;         use System;
with MicroBit.Types; use MicroBit.Types;

package Shared_Sensor_Data is
   protected Sensor_Data
     with Priority => Priority'Last - 1
   is
      procedure Set_Distance_R (Value : Distance_cm);
      procedure Set_Distance_L (Value : Distance_cm);

      function Get_Distance_R return Distance_cm;
      function Get_Distance_L return Distance_cm;

   private
      Distance_R, Distance_L : Distance_cm := 0;
   end Sensor_Data;
end Shared_Sensor_Data;
