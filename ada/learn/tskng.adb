with ada.text_io;
use ada.text_io;

procedure tskng is
	task type timer is
		entry halt;
	end timer;
	task type s is
		entry a;
	end s;

	task body s is begin
		loop
			select
				accept a do
					put_line("[s]a");
				end a;
			or
				delay 1.0;
				exit;
			end select;
		end loop;
	end s;

	task body timer is begin
		loop
			select
				accept halt; exit;
			or
				delay 0.5;
				put_line("---another half of second passed!");
			end select;
		end loop;
	end timer;
	
	ss : array(1..5) of s;
	t: timer;
begin
	for i in 1..20 loop
		ss(1).a;
		delay 0.25;
	end loop;
	t.halt;
	put_line("over here!");
end tskng;
