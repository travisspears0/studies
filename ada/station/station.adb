with ada.text_io, Ada.Strings.Unbounded;
use ada.text_io, Ada.Strings.Unbounded;

package body station is

	protected body p is
                procedure e is begin
                        put("e");
                end e;
        end p;


	taken_ids: array(1..9999) of boolean := (others => false);	
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

	function leave(id: integer) return boolean is
        begin
		for i in state_pool'range loop
			if state_pool(i) = id then
				state_pool(i) := 0;
				return true;
			end if;
		end loop;
		return false;
        end;

	function take_id return integer is
        begin
                for i in taken_ids'range loop
                        if taken_ids(i) = false then return i; end if;
                end loop;
                return -1;
        end take_id;

	procedure free_id(id: integer) is
	begin
		if id /= -1 then
			taken_ids(id) := false;
		end if;
	end free_id;

	--returns number of slot taken or -1 if there are no free slots
	function take_slot(id: positive) return integer is
		free_slot: integer;
		--wait_task : wait_task_pointer;
	begin
		free_slot := get_free_slot(id);
		if free_slot /= -1 then
			--put_line("taking slot ("& free_slot'img &") for " & time'img & ", user: " & id'img);
			--wait_task := new wait_task_type(new duration'(time),new integer'(free_slot), new positive'(id));
			state_pool(free_slot) := id;
			return free_slot;
		else
			--put_line("there are no free slots");
			return -1;
		end if;
	end take_slot;
	--
	function get_state return unbounded_string is
		result: unbounded_string;
	begin
		result := to_unbounded_string("s");
		for i in 1..places loop
			result := result & to_unbounded_string(state_pool(i)'img);
		end loop;
		return result;
	end;
	--
	function get_free_slot(id: integer) return integer is
	begin
		for i in 1..places loop
			if state_pool(i) = id then return -1; end if;
		end loop;
		for i in 1..places loop
			if state_pool(i) = 0 then return i; end if;
		end loop;
		return -1;
	end get_free_slot;

end station;
