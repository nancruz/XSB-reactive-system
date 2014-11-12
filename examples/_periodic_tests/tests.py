import os;
os.system("rm *.log");
#dirs = ["periodic_03"];
dirs = ["periodic_01","periodic_02","periodic_05"];
max_i = 3;
for d in dirs:
	for i in range(0,max_i):
		cmd = "sh ../examples/" + d + "/test.sh > ../examples/_periodic_tests/" + d +"_"+`i`+ ".log";
		os.system(cmd);

for d in dirs:
	for i in range(0,max_i):
		if 'passed' in open('../examples/_periodic_tests/'+d+"_"+`i`+'.log').read():
			print d + "_"+`i` + ": passed";
		else:
			print d + "_"+`i`+ ": failed";
