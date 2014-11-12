$XSB/bin/xsb-mt --shared_predicates -e "['etalis.P'],
set_etalis_flag(output_temporary_files,on), set_etalis_flag(logging_to_file,on), set_etalis_flag(store_fired_events,on), 
compile_event_file('../examples/periodic_03/test_01.event'),
event(start), sleep(1), event(d(1)), sleep(6), event(d(2)), sleep(7),event(d(3)),sleep(6),event(fini),sleep(1),
List=[event(f(2),1),event(f(3),1),event(c(2),1),event(c(3),1),event(e(2),1),event(e(3),1),event(a,4),event(b,9)],
(check_fired_events(List) -> write('periodic_02\t\t\tpassed\n') ; write('periodic_02\t\t\tfailed\n')),sleep(1),halt."