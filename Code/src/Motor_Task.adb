with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console;     use MicroBit.Console;
with Shared_Data;          use Shared_Data;

package body Motor_Task is

   task body Motor is
   begin
      Put_Line ("[MOTOR] Task started.");

      loop
         -- Bare kjør hvis controlleren ikke bruker motoren
         if not Collision_State.Control_Active then
            if Collision_State.Should_Stop then
               Drive (Stop);
               Put_Line ("[MOTOR] STOP! Obstacle detected.");
            else

               Drive (Forward, (3000, 3000, 3000, 3000));
               Put_Line ("[MOTOR] Driving forward...");
            end if;
         end if;

         delay 0.1;
      end loop;
   end Motor;

end Motor_Task;
