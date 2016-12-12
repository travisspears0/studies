with ada.Strings.Unbounded;
use ada.Strings.Unbounded;

generic
	places: positive;
package station is

	function leave(id: integer) return boolean;
	function take_slot(id: positive) return integer;
	function get_free_slot(id: integer) return integer;
	function get_state return unbounded_string;
end station;
