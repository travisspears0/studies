with ada.text_io, Ada.Strings.Unbounded;
use ada.text_io, Ada.Strings.Unbounded;

package body station is

	protected body client is
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
		begin
			get_free_slot(id,free_slot);
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
