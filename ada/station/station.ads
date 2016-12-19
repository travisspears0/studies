with ada.Strings.Unbounded;
use ada.Strings.Unbounded;

generic
	places: positive;
package station is

	type taken_ids_t is array(1..9999) of boolean;
	type state_pool_t is array(1..places) of integer;
	type hours_type is range 0..23;
	type minutes_type is range 0..59;
	
	procedure get_time;

	protected client is--funkcje przerobic na procedury...
		procedure take_id(id: out integer);
		procedure free_id(id: integer);
		procedure leave(id: integer; success: out boolean);
		procedure take_slot(id: positive; free_slot: out integer);
		procedure get_state(state: out unbounded_string);
	private
		procedure get_free_slot(id: integer; free_slot: out integer);
		i :integer := 4;
		taken_ids: taken_ids_t := (others => false);
		state_pool: state_pool_t := (others => 0);
	end client;
end station;
