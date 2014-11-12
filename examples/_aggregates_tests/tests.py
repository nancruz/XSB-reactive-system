import os;
os.system("rm *.log");
dirs = ["aggregates_01","aggregates_02", "aggregates_03","aggregates_04","window_aggregation"];
for d in dirs:
	cmd = "sh " + d + "/test.sh > _aggregates_tests/" + d + ".log";
	os.system(cmd);

for d in dirs:
	if 'passed' in open('_aggregates_tests/' +d+'.log').read():
		print d + ": passed";
	else:
		print d + ": something wrong";
