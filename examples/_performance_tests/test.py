import os;
import subprocess;

test = ['1','2','3'];
test2 = ['1_1'];
dataset = "../examples/_performance_tests/";
#data = ["1000.P","5000.P","10000.P","25000.P"];
data = ["1000.P"];
data2 = ["1000.P","5000.P","10000.P","20000.P"];
# for t in test:
# 	for i in range(0,3):
# 		for d in data:
# 			prog = "$XSB/bin/xsb --quietload -p -e \"['etalis.P'],";
# 			prog += "compile_event_file('" + dataset + t +"/test.event'),";
# 			prog += "['../examples/_performance_tests/test.P'],";
# 			prog += "test('../examples/_performance_tests/data/" + t+"_"+d + "'), halt.\" > xsb_" + "test_"+ t + "-" + d + "-" + str(i);
# 			os.system(prog);

for t in test2:
	for i in range(0,3):
		for d in data:
			prog = "$XSB/bin/xsb-mt --shared_predicates --quietload -p -e \"['etalis.P'],";
			prog += "compile_event_file('" + dataset + t +"/test.event'),";
			prog += "['../examples/_performance_tests/test.P'],";
			prog += "test('../examples/_performance_tests/data/" + str(3) +"_"+ d + "'), halt.\" > xsb_" + "test_"+ t + "-" + d + "-" + str(i);
			os.system(prog);