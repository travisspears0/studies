generic
	size: positive;
	type eltype is private;
package buf is

	function getCount return integer;
	procedure push(e: eltype);
	procedure pop(e:out eltype);

end buf;
