with ada.text_io, Ada.Strings.Unbounded;
use ada.text_io, Ada.Strings.Unbounded;

package body station is

	state_pool: array(1..places) of integer := (others => 0);

	task type wait_task_type(time: access duration;slot: access integer; id: access positive);

	task body wait_task_type is
	begin
		put_line("[start]" & slot.all'img);
		state_pool(slot.all) := id.all;
		delay time.all;
		state_pool(slot.all) := 0;
		put_line("[end]" & slot.all'img);
	end;

	type wait_task_pointer is access all wait_task_type;

	--
	procedure take_slot(time: duration; id: positive) is
		free_slot: integer;
		wait_task : wait_task_pointer;
	begin
		free_slot := get_free_slot;
		if free_slot /= -1 then
			put_line("taking slot ("& free_slot'img &") for " & time'img & ", user: " & id'img);
			wait_task := new wait_task_type(new duration'(time),new integer'(free_slot), new positive'(id));
		else
			put_line("there are no free slots");
		end if;
	end take_slot;
	--
	function print_state return unbounded_string is
		result: unbounded_string;
	begin
		result := to_unbounded_string("s ");
		for i in 1..places loop
			if state_pool(i) /= 0 then 
				result := result & to_unbounded_string(i'img & ":" & state_pool(i)'img);
			else
				result := result & to_unbounded_string(i'img & ":0");
			end if;
		end loop;
		return result;
	end;
	--
	function get_free_slot return integer is
	begin
		for i in 1..places loop
			if state_pool(i) = 0 then return i; end if;
		end loop;
		return -1;
	end get_free_slot;

end station;
