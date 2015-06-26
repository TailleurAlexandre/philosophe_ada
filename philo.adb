--  Abstract :
--
--
--

with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;

package body philo is
   protected body Stick is

      entry Grab when Status = Down is
      begin
	 Status := Taken;
      end;

      procedure Put_Down is
      begin
	 Status := Down;
      end Put_Down;

      function Get_Status return Status_St is
      begin
	 return Status;
      end ;
   end Stick;

   function	Get_Righ_Nb(I : Integer) return Integer is
   begin
      if I < 1 then
	 return 7;
      elsif I > 7 then
	 return 1;
      end if;
      return I;
   end;

   task body Philosopher is
      Stat : Status_T := Sleeping;
      Rice : Integer := 1000;
   begin
      loop
	 exit when Rice = 0;
	 if First.Get_Status = Down and Stat /= Eating and Rice > 0 then
	    if Second.Get_Status = Down and Stat /= Eating then
	       Second.Grab;
	       First.Grab;
	       Stat := Eating;
	       Put_Line(Philo'Image(Id) & " is eating");
	       Rice := Rice - 100;
	       delay 0.100;
	       Second.Put_down;
	       First.Put_down;
	    else
	       Stat := Thinking;
	       Put_Line(Philo'Image(Id) & " is thinking");
	       First.Grab;
	       delay 0.100;
	       First.Put_down;
	    end if;
	 else
	    Stat := sleeping;
	    Put_Line(Philo'Image(Id) & " is waiting");
	    delay 0.100;
	 end if;
      end loop;
   end Philosopher;

   procedure Run is
      Ph_1 : Philosopher((Karistote), Sticks_e(1)'Access, Sticks_e(2)'Access);
      Ph_2 : Philosopher((Anon), Sticks_e(2)'Access, Sticks_e(3)'Access);
      Ph_3 : Philosopher((Bob), Sticks_e(3)'Access, Sticks_e(4)'Access);
      Ph_4 : Philosopher((Jim), Sticks_e(5)'Access, Sticks_e(6)'Access);
      Ph_5 : Philosopher((Toto), Sticks_e(6)'Access, Sticks_e(7)'Access);
      Ph_6 : Philosopher((Titi), Sticks_e(7)'Access, Sticks_e(8)'Access);
      Ph_7 : Philosopher((Tata), Sticks_e(8)'Access, Sticks_e(1)'Access);
   begin
      null;
   end;
begin
   null;
end philo;
