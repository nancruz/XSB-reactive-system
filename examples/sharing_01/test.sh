$XSB/bin/xsb-mt --quietload --shared_predicates -e "['etalis.P'], 
set_etalis_flag(rule_sharing,on), set_etalis_flag(output_temporary_files,on), compile_event_file('test_01.event'),halt."
