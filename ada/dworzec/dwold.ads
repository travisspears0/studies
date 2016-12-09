generic
	places: positive;
package dworzec is
	procedure init;
	procedure print_actions;
	procedure take_slot(time: duration);
	procedure print_state;
	procedure quit;

	function get_free_slot return integer;
end dworzec;
