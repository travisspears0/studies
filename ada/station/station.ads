with ada.Strings.Unbounded;
use ada.Strings.Unbounded;

generic
	places: positive;
package station is 
										--protected

	protected p is
		procedure e;
	end p;

	function take_id return integer;
	procedure free_id(id: integer);
	function leave(id: integer) return boolean;
	function take_slot(id: positive) return integer;
	function get_free_slot(id: integer) return integer;
	function get_state return unbounded_string;
end station;
