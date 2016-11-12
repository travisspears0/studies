with ada.text_io, ada.integer_text_io, ada.numerics.discrete_random;
use ada.text_io, ada.integer_text_io; 

procedure rnd is
	task tsk is
		entry losuj(min:integer; max:integer);
		entry koncz;
	end tsk;
	
	task body tsk is
		type rng is range 0..9;
	        package rnd is new Ada.Numerics.Discrete_Random(rng);
	        gen : rnd.generator;
	        function getrnd(min:integer;max:integer) return rng is begin
	                rnd.reset(gen);
	                return rnd.random(gen);
	        end getrnd;
	begin
		loop
			select
				accept losuj(min:integer;max:integer) do
					put(getrnd(min,max)'img);
					delay 0.3;
				end losuj;
			or
				accept koncz; exit;
			end select;
		end loop;
	end tsk;
begin
	for i in 1..10 loop
		tsk.losuj(1,5);
	end loop;
	tsk.koncz;
end rnd;
