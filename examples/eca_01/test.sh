$XSB/bin/xsb-mt -e "[etalis],
compile_event_file('../examples/eca_01/test_01.event')."
#event(a),event(b),event(c),
#((a(1),a(2)) -> write('eca_01\t\t\tpassed\n');write('eca_01\t\t\tfailed\n'))."