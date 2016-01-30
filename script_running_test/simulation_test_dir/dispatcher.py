#!/home/brando90/envs/phy/bin/python
import sh as sh
import numpy as np
import time
#time.sleep(5)

print("running dispatcher")

start_centers = 5
end_centers = 200
num_centers = 10
centers = np.floor( np.linspace(start_centers, end_centers, num_centers) )
for center in centers:
	sbatch('worker.sh' , str(i), _bg=True ) #run as background process == True

f = open('counter.txt', 'w+')
sh.wc( sh.ls("./simulation_results", "-1"), "-l",_out="counter.txt")
file_counter = int(f.readlines()[0])

while file_counter != num_centers
	time.sleep(1.1) #sleeps in seconds
	sh.wc( sh.ls("./simulation_results", "-1"), "-l",_out="counter.txt")
	file_counter = int(f.readlines()[0])	 

f.close()
