with ada.text_io;
use ada.text_io;

procedure tskng3 is
	task type t is
		entry a;
		entry q;
	end t;
	
	task body t is
	begin
		select
			accept a do
				put_line("a start");
				delay 0.9;
				put_line("a end");
			end a;
			accept q;put_line("end t");
		end select;
	end t;

	type pt is access t;
        ot: pt;

	task type u;
	task body u is
		oot: pt;
	begin
		oot := new t;
		put_line("u start");
		oot.a;
		delay 0.5;
		oot.q;
		put_line("u end");
	end u;

	type pu is access u;
	ou: pu;
begin
	put_line("--- test 1");
	ot := new t;
	ot.a;
	put_line("body");
	ot.q;
	put_line("--- test 2");
	ou := new u;
	put_line("body");
end tskng3;
