with ada.Strings.Unbounded;
use ada.Strings.Unbounded;

generic
	places: positive;
package station is
	procedure take_slot(time: duration; id: positive);

	function get_free_slot return integer;
	function print_state return unbounded_string;
end station;
