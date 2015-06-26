--  Abstract :
--
--
--

package philo is
   procedure Run;
   type Philo is (Karistote, Anon, Bob, Jim, Toto, Titi, tata);
   type Status_T is (Eating, Sleeping, Thinking);
   type Status_St is (Taken, Down);


   protected type Stick is
      entry Grab;
      procedure Put_down;
      function Get_Status return Status_St;
   private
      Status : Status_St := down;
   end;
   task type Philosopher (Id : Philo; First, Second : not null access Stick);
   Sticks_e : array (1..8) of aliased Stick;
end philo;
