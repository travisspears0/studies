with ada.text_io, ada.integer_text_io, ada.numerics.discrete_random;
use ada.text_io, ada.integer_text_io; 

procedure rnd is
	type rng is range 0..9;
	package rnd is new Ada.Numerics.Discrete_Random(rng);
	
	task tsk is
		entry losuj(min:integer; max:integer);
		entry los(min:integer; max:integer; res: in out rng);
		entry koncz;
	end tsk;
	
	task body tsk is
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
				accept los(min:integer; max:integer; res: in out rng) do
					res := getrnd(min,max);
				end los;
			or
				accept koncz; exit;
			end select;
		end loop;
	end tsk;
	x:rng;
begin
	for i in 1..10 loop
		tsk.los(1,5,x);
		put(x'img);
		--tsk.losuj(1,5);
	end loop;
	tsk.koncz;
end rnd;
