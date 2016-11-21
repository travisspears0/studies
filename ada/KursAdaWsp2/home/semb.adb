with ada.text_io, ada.strings.unbounded;
use ada.text_io;

procedure semb is
	use ada.strings.unbounded;
	protected screen is
		entry display(s:string);
		private
			free: boolean := true;
	end screen;
	
	protected body screen is
		entry display(s:string) when free is
		begin
			free := false;
			put_line("[screen]" & s);
			delay 0.3;
			free := true;
		end display;
	end screen;

begin
	for i in 1..10 loop
		screen.display("elo " & i'img);
	end loop;
end semb;

