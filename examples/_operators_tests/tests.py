import os;
os.system("rm *.log");
dirs = ["and_01","or_01","cnot_01","par_01","sequence_03","meets_02","during_02","starts_01","finishes_01","equals_01","where_01","windows_01"];
for d in dirs:
	cmd = "sh " + d + "/test.sh > " + d + ".log";
	os.system(cmd);

for d in dirs:
	if 'passed' in open(d+'.log').read():
		print d + ": passed";
	else:
		print d + ": something wrong";
