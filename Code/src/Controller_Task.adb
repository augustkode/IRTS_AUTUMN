with Shared_Data;          use Shared_Data;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console;     use MicroBit.Console;
with HAL;                  use HAL;

package body Controller_Task is

   task body Controller is
      Rotating : Boolean := False;
   begin
      Put_Line ("[CTRL] Controller started.");

      loop
         -- Start rotasjon bare hvis hindring oppdages og controlleren ikke allerede roterer
         if Collision_State.Should_Stop and not Collision_State.Control_Active then
            Put_Line ("[CTRL] Obstacle ahead → taking control & yaw left...");
            Collision_State.Set_Control (True);
            Drive (Yaw_Left, (UInt12(3000), UInt12(3000), UInt12(3000), UInt12(3000)));

            -- kort rotasjon (juster varighet etter behov)
            delay (0.05);

            Drive (Stop);
            Collision_State.Set_Control (False);
            Put_Line ("[CTRL] Rotation done, control released.");
         end if;

         delay 0.02;
      end loop;
   end Controller;

end Controller_Task;
