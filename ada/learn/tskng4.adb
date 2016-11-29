with ada.text_io;
use ada.text_io;

procedure tskng4 is
	task type t is
		entry a;
		entry b;
	end t;

	task body t is
	begin
		loop
			select
				accept a do
					put_line("a");
				end a;
			or
				delay 1.0;
				log_error("over a");
				exit;
			end select;
			select
				accept b do
					put_line("b");
				end b;
			or
				delay 1.0;
				put_line("over b");
				exit;
			end select;
		end loop;
	end t;

	tx: t;
begin
	put_line("start");
	tx.a;
	delay 0.5;
	tx.b;
	put_line("end");
end tskng4;
