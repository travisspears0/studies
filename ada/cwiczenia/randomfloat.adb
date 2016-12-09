with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random ;

procedure randomfloat is
	gen : generator;
	f: float;
begin
	reset(gen, 1);
	for i in 1..100 loop
		f := random(gen);
		delay duration(f);
		put_line(f'img);
	end loop;
end randomfloat;
