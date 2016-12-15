with ada.text_io, ada.strings, ada.strings.fixed;
use ada.text_io, ada.strings, ada.strings.fixed;

procedure nline is
	c: character := ' ';
	
	procedure flushscreen is
	begin
		put(ascii.esc & "[2J" & ascii.esc & "[0;0H" & ascii.esc & "[0m");
	end flushscreen;

begin
	while c /= 'q' loop
		flushscreen;
		put("podaj literke ");
		get(c);
	end loop;
end nline;
