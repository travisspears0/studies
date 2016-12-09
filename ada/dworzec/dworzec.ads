generic
	places: positive;
package dworzec is
	procedure print_actions;
	procedure take_slot(time: duration);
	procedure print_state;

	function get_free_slot return integer;
end dworzec;
