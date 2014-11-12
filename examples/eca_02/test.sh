$XSB/bin/xsb-mt -e "[etalis],
set_etalis_flag(output_temporary_files,on),
compile_event_file('../examples/eca_02/test_01.event'),
event(d),event(e),event(f),
((a(1),a(2),a(3)) -> write('eca_02\t\t\tpassed\n');write('eca_02\t\t\tfailed\n'))."