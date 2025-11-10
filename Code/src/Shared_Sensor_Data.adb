with Shared_Sensor_Data;

package body Shared_Sensor_Data is
   protected body Sensor_Data is

      procedure Set_Distance_L (Value : Distance_cm) is
      begin
         Distance_L := Value;
      end Set_Distance_L;

      procedure Set_Distance_R (Value : Distance_cm) is
      begin
         Distance_R := Value;
      end Set_Distance_R;

      function Get_Distance_L return Distance_cm is
      begin
         return Distance_L;
      end Get_Distance_L;

      function Get_Distance_R return Distance_cm is
      begin
         return Distance_R;
      end Get_Distance_R;

   end Sensor_Data;
end Shared_Sensor_Data;
