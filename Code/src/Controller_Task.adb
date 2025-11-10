with Shared_Data;          use Shared_Data;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console;     use MicroBit.Console;
with HAL;                  use HAL;
with Ada.Exceptions;       use Ada.Exceptions;
with Ada.Real_Time;        use Ada.Real_Time;

package body Controller_Task is
   task body Controller is
      Period        : constant Time_Span := Milliseconds (100);
      Next          : Time := Clock;
      Start, Finish : Time;
      Rotating      : Boolean := False;
   begin
      loop
         if Collision_State.Should_Stop and not Collision_State.Control_Active
         then
            Collision_State.Set_Control (True);
            case Collision_State.Get_State is
               when turn_left  =>
                  Drive (Yaw_Left, (3000, 3000, 3000, 3000));

               when turn_right =>
                  Drive (Yaw_Right, (3000, 3000, 3000, 3000));
                  Drive (Stop);

               when forward    =>
                  Drive (Forward, (3000, 3000, 3000, 3000));
                  Drive (Stop);

               when backward   =>
                  Drive (Backward, (3000, 3000, 3000, 3000));
                  Drive (Stop);

               when left       =>
                  Drive (Left, (3000, 3000, 3000, 3000));
                  Drive (Stop);

               when right      =>
                  Drive (Right, (3000, 3000, 3000, 3000));
                  Drive (Stop);

               when idle       =>
                  Drive (Stop);
                  null;

               when others     =>
                  raise Constraint_Error with "Unknown State_Type value";
            end case;
            Collision_State.Set_Control (False);
         end if;

         Next := Next + Period;
         delay until Next;
      end loop;
   exception
      when others =>
         Put_Line ("[CTRL] Exception in controller task");
   end Controller;

end Controller_Task;
