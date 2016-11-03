with ada.text_io, ada.integer_text_io, ada.numerics.discrete_random;
use ada.text_io, ada.integer_text_io; 

procedure random is
	type rng is range 0..9;
	package rnd is new Ada.Numerics.Discrete_Random(rng);
        gen : rnd.generator;
        function f return integer is (1);
        function ff(min:integer;max:integer) return rng is begin
                rnd.reset(gen);
                return rnd.random(gen);
        end ff;
begin
	for i in 1..100 loop
	        put(ff(5,20)'img);
	end loop;
end random;
