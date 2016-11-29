with ada.text_io, ada.integer_text_io, ada.command_line, gnat.os_lib;
use ada.text_io, ada.integer_text_io, ada.command_line, gnat.os_lib;

--commands:
--gpio mode 1 out;
--gpio write 1 1/0

procedure ag is
        success         : boolean;
        gpio            : string := "../../wiringPi/gpio/gpio";
        mode_args       : argument_list_access;
        high_args       : argument_list_access;
        low_args        : argument_list_access;
begin
        put_line("initializing...");
        mode_args := argument_string_to_list("mode 1 out");
        high_args := argument_string_to_list("write 1 1");
        low_args := argument_string_to_list("write 1 0");
        spawn(gpio, mode_args.all, success);
        put_line("initialization: " & success'img);
        loop
                spawn(gpio, high_args.all, success);
                delay 0.5;
                spawn(gpio, low_args.all, success);
                delay 0.5;
                if not success then
                        raise program_error;
                end if;
        end loop;
        exception
                when program_error => put_line("error occured while performing gpio");
end ag;
