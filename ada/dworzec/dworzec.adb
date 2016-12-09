with ada.text_io;
use ada.text_io;

package body dworzec is

	busy_pool: array(1..places) of boolean := (others => true);

	task type wait_task_type(time: access duration;slot: access integer);

	task body wait_task_type is
	begin
		put_line("[start]" & slot.all'img);
		busy_pool(slot.all) := false;
		delay time.all;
		busy_pool(slot.all) := true;
		put_line("[end]" & slot.all'img);
	end;

	type wait_task_pointer is access all wait_task_type;


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
		wait_task : wait_task_pointer;
	begin
		free_slot := get_free_slot;
		if free_slot /= -1 then
			put_line("taking slot ("& free_slot'img &") for " & time'img);
			wait_task := new wait_task_type(new duration'(time),new integer'(free_slot));
		else
			put_line("there are no free slots");
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
	--procedure quit is
	--begin
	--	for i in 1..places loop
	--		wait_pool(i).stop;
	--	end loop;
	--end;
	--
	function get_free_slot return integer is
	begin
		for i in 1..places loop
			if busy_pool(i) = true then return i; end if;
		end loop;
		return -1;
	end get_free_slot;

end dworzec;
