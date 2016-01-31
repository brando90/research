#!/home/brando90/envs/phy/bin/python
import sh as sh
import numpy as np
import time
import timeit
from datetime import datetime
import HBF1_vs_RBF_config.py
#
print("running dispatcher")
start_time = timeit.default_timer()
## Train all the models
centers = np.floor( np.linspace(start_centers, end_centers, num_centers) )
for center in centers:
	sh.sbatch('worker.sh' , str(center), str(beta), str(num_inits), str(iterations), str(train_alg), str(reg_lambda), _bg=True ) #run as background process == True
## check if all models have finished running
f = open('counter.txt', 'w+')
sh.wc( sh.ls("./simulation_results", "-1"), "-l",_out="counter.txt")
file_counter = int(f.readlines()[0])
while file_counter < num_centers:
	#time.sleep(0.0001) #sleeps in seconds
	sh.wc( sh.ls("./simulation_results", "-1"), "-l",_out="counter.txt")
	f.seek(0)
	file_counter = int(f.readlines()[0])
elapsed = timeit.default_timer() - start_time
## if all models have finished running, collect simulation results
print('Elapsed time for disptcher: ', elapsed)
time.sleep(5)

sh.rm(sh.glob("./slurm*"))
f.close()
