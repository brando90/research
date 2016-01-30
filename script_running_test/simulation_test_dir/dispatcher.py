#!/home/brando90/envs/phy/bin/python
import sh as sh
import numpy as np
import time
import timeit
print("running dispatcher")
start_time = timeit.default_timer()
#
start_centers = 5
end_centers = 700
num_centers = 100
centers = np.floor( np.linspace(start_centers, end_centers, num_centers) )
for center in centers:
	sh.sbatch('worker.sh' , str(center), _bg=True ) #run as background process == True

f = open('counter.txt', 'w+')
sh.wc( sh.ls("./simulation_results", "-1"), "-l",_out="counter.txt")
file_counter = int(f.readlines()[0])
while file_counter != num_centers:
	#time.sleep(0.0001) #sleeps in seconds
	sh.wc( sh.ls("./simulation_results", "-1"), "-l",_out="counter.txt")
	f.seek(0)
	file_counter = int(f.readlines()[0])	 
elapsed = timeit.default_timer() - start_time
print('Elapsed time for disptcher: ', elapsed)

f.close()
