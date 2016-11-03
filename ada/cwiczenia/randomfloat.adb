with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random ;

procedure randomfloat is
	gen : generator;
begin
	reset(gen, 9);
	for i in 1..100 loop
		put_line(random(gen)'img);
	end loop;
end randomfloat;
