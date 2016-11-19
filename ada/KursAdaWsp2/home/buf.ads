generic
	size: positive;
	type eltype is private;
package buf is

procedure push(x:eltype);
procedure pop(x:out eltype);

end buf;
