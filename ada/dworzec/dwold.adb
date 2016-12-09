with ada.text_io;
use ada.text_io;

package body dworzec is

	busy_pool: array(1..places) of boolean := (others => true);

	task type wait_task is
		entry init(i:integer);
		entry start(time:duration);
		entry stop;
	end wait_task; 

	task body wait_task is
		index: positive;
	begin
		accept init(i: integer) do
			index := i;
		end init;
		loop
			select
				accept start(time: duration) do
					put_line("---start ("& index'img &")" & time'img);
					busy_pool(index) := false;
					delay time;
					busy_pool(index) := true;
					put_line("---start end("& index'img &")");
				end start;
			or
				accept stop;exit;
			end select;
		end loop;
	end wait_task;

	wait_pool: array(1..places) of wait_task;
	--
	procedure init is
	begin
		for i in 1..places loop
			wait_pool(i).init(i);
		end loop;
	end;
	--
	procedure print_actions is
	begin
		put_line("actions:");
                put_line("a - add bus");
                put_line("s - print station state");
                put_line("q - quit");
                put_line("? - help");
	end;
	--
	procedure take_slot(time: duration) is
		free_slot: integer;
	begin
		free_slot := get_free_slot;
		if free_slot /= -1 then
			put_line("taking slot ("& free_slot'img &") for " & time'img);
			wait_pool(free_slot).start(time);
		end if;
	end take_slot;
	--
	procedure print_state is
	begin
		for i in 1..places loop
			put("slot " & i'img & "is");
			if busy_pool(i) = true then 
				put(" free");
			else
				put(" taken");
			end if;
			put_line("");
		end loop;
	end;
	--
	procedure quit is
	begin
		for i in 1..places loop
			wait_pool(i).stop;
		end loop;
	end;
	--
	function get_free_slot return integer is
	begin
		for i in 1..places loop
			if busy_pool(i) = true then return i; end if;
		end loop;
		return -1;
	end get_free_slot;

end dworzec;
