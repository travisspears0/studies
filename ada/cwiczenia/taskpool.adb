with ada.text_io;
use ada.text_io;

procedure taskpool is
	task type t is
		entry a;
		entry b;
	end t;
	task body t is
	begin
		accept a;
			put("a");
		accept b;
			put("b");
	end t;
	tasks: array(1..1) of t;
begin
	tasks(1).a;
	tasks(1).b;
end taskpool;
