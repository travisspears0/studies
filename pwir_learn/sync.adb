with ada.text_io;
use ada.text_io;

procedure sync is

	task t is
		entry a;
		entry b;
		entry q;
	end t;
	task body t is
	begin
		loop
			select
				accept a;
					put_line("a");
			or
				accept b;
					put_line("b");
			or 
				accept q;exit;
			end select;
		end loop;
		put_line("end t");
	end;

begin
	for i in 1..5 loop
		t.a;
		t.b;
	end loop;
	t.q;
	put_line("end main");
end sync;










