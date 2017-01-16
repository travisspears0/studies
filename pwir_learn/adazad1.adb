with ada.text_io;
use ada.text_io;

procedure adazad1 is
	
	task A is
		entry e;
	end A;
	
	task body A is
	begin
		loop
			select
				accept e do
					put_line("[+]accepted");
				end e;
			or
				delay 1.0;
				put_line("[-]not accepted");
				exit;
			end select;
		end loop;
	end;
	
	c:character;
begin
	put_line("to accept put char:");
	get(c);
	A.e;
end adazad1;
