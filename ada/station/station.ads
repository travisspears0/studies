with ada.Strings.Unbounded;
use ada.Strings.Unbounded;

generic
	places: positive;
package station is

	type taken_ids_t is array(1..9999) of boolean;
	type state_pool_t is array(1..places) of integer;
	type hours_type is range 0..23;
	type minutes_type is range 0..59;
	task type time_task;
	
	minute_last: constant duration := 0.01;
	open_hour : constant hours_type := 6;
	close_hour : constant hours_type := 23;
	tt: time_task;
	minutes: minutes_type := 55;
        hours: hours_type := 23;
	
	procedure get_time;
	function get_minute_last return duration;
	procedure abort_time_task;

	protected client is
		procedure take_id(id: out integer);
		procedure free_id(id: integer);
		procedure leave(id: integer; success: out boolean);
		procedure take_slot(id: positive; free_slot: out integer);
		procedure get_state(state: out unbounded_string);
		procedure is_opened(op: out boolean); 
	private
		procedure get_free_slot(id: integer; free_slot: out integer);
		i :integer := 4;
		taken_ids: taken_ids_t := (others => false);
		state_pool: state_pool_t := (others => 0);
		opened: boolean;
	end client;
end station;
