with ada.text_io, Ada.Strings.Unbounded;
use ada.text_io, Ada.Strings.Unbounded;

package body station is

	function get_minute_last return duration is (minute_last);

	procedure get_time is begin
		put_line("station time: " & hours'img & ":" & minutes'img);
	end get_time;

	time_task_active: boolean := true;
	task body time_task is
	begin
		while time_task_active = true loop
			if(minutes = minutes_type'last) then
				minutes := 0;
				if(hours = hours_type'last) then
					hours := 0;
				else
					hours := hours + 1;
				end if;
			else
				minutes := minutes + 1;
			end if;
			delay minute_last;
		end loop;
	end time_task;

	procedure abort_time_task is
	begin
		time_task_active := false;
	end abort_time_task;

	protected body client is
		procedure is_opened(op: out boolean) is
		begin
			if hours >= open_hour and hours < close_hour then
				opened := true;
			else
				opened := false;
			end if;
			op := opened;
		end;
		----------------------------------------------------------------------------------
		procedure take_id(id: out integer) is
		begin
			id := -1;
		        for i in taken_ids'range loop
		                if taken_ids(i) = false then
					id := i;
					taken_ids(i) := true;
					exit;
				end if;
		        end loop;
		end take_id;
		----------------------------------------------------------------------------------
		procedure leave(id: integer;success: out boolean) is
		begin
			success := false;
			for i in state_pool'range loop
				if state_pool(i) = id then
					state_pool(i) := 0;
					success := true;
					exit;
				end if;
			end loop;
		end;
		----------------------------------------------------------------------------------
		procedure free_id(id: integer) is
		begin
			if id /= -1 then
				taken_ids(id) := false;
			end if;
		end free_id;
		----------------------------------------------------------------------------------
		--returns number of slot taken or -1 if there are no free slots
		procedure take_slot(id: positive; free_slot: out integer) is
			opnd: boolean := false;
		begin
			is_opened(opnd);
			get_free_slot(id,free_slot);
			if opnd /= true then free_slot := -1; end if;
			if free_slot /= -1 then
				state_pool(free_slot) := id;
			end if;
		end take_slot;
		----------------------------------------------------------------------------------
		procedure get_state(state: out unbounded_string) is
		begin
			state := to_unbounded_string("s");
			for i in 1..places loop
				state := state & to_unbounded_string(state_pool(i)'img);
			end loop;
		end;
		----------------------------------------------------------------------------------
		procedure get_free_slot(id: integer; free_slot: out integer) is
		begin
			free_slot := -2;
			for i in 1..places loop
				if state_pool(i) = id then free_slot := -1; end if;
			end loop;
			if(free_slot /= -1) then
				for i in 1..places loop
					if state_pool(i) = 0 then free_slot := i;exit; end if;
				end loop;
			end if;
		end get_free_slot;

        end client;

end station;
