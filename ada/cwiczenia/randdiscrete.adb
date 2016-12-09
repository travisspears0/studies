with Ada.Text_IO, Ada.Numerics.discrete_random;
use Ada.Text_IO;--, Ada.Numerics.discrete_random ;

procedure randdiscrete is
	subtype inttype is Integer range 1..3;
	subtype flotype is float range 1.0..3.0;
	package dr is new ada.numerics.discrete_random(inttype);
	use dr;
	g:generator;
	x:inttype;
begin
	reset(g);
	for i in 1..20 loop
		put_line(duration(random(g))'img);
	end loop;
end randdiscrete;
