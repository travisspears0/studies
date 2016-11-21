generic
	size: positive;
	type eltype is private;
package buf is

	procedure push(e: eltype; b: out boolean);
	procedure pop(e:out eltype; b: out boolean);

end buf;
