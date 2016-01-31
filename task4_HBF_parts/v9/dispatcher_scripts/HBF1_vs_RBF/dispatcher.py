#!/home/brando90/envs/phy/bin/python
import sh as sh
import numpy as np
import time
import timeit
from datetime import datetime
from HBF1_vs_RBF_config import *

def train_all_models(start_centers, end_centers, num_centers, beta, num_inits, train_alg, iterations, reg_lambda, dir_name_4_current_simulation, in_om=True):
	centers = np.floor( np.linspace(start_centers, end_centers, num_centers) )
	for center in centers:
		if in_om:
			#TODO
			sh.sbatch('worker.sh' , str(center), str(beta), str(num_inits), str(iterations), str(train_alg), str(reg_lambda), _bg=True ) #run as background process == True
		else:
			path = '../HBF_mat_lib/HBF1_multivariant_regression/HBF1/train_model/get_best_trained_hbf1_model'
			arguments = "{} , {}, {}, {}, {}, {}, {}".format(start_centers, end_centers, num_centers, beta, num_inits, train_alg, iterations, reg_lambda, dir_name_4_current_simulation)
			matlab_cmd = 'get_best_trained_hbf1_model( {} )'.format(arguments)
			h.matlab('-nodesktop', '-nosplash', '-nojvm', '-r', matlab_cmd)

def wait_until_all_simulations_have_ran(dir_name_4_current_sim, num_centers):
	f = open('counter.txt', 'w+')
	sh.wc( sh.ls("./simulation_results/dir_name_4_current_sim", "-1"), "-l", _out="counter.txt")
	file_counter = int(f.readlines()[0])
	while file_counter < num_centers:
		#time.sleep(0.0001) #sleeps in seconds
		sh.wc( sh.ls("./simulation_results", "-1"), "-l",_out="counter.txt")
		f.seek(0)
		file_counter = int(f.readlines()[0])

def collect_all_simulation_data():
	#TODO
	return -1

if __name__ == "__main__":
		start_time = timeit.default_timer()
		dir_name_4_current_simulation = str(datetime.now()).replace(" ", "_") #'2016-01-31_11:21:46.758577'
		sh.mkdir("./simulations_results/"+dir_name_4_current_simulation)

		## Train all the models
		print start_centers
		train_all_models(start_centers, end_centers, num_centers, beta, num_inits, train_alg, iterations, reg_lambda, dir_name_4_current_simulation, in_om)
		## wait until all simulations have ran
		wait_until_all_simulations_have_ran(num_centers)
		elapsed = timeit.default_timer() - start_time
		## if all models have finished running, collect simulation results
		collect_all_simulation_data()
		print('Elapsed time for disptcher: ', elapsed)
		time.sleep(5)
		sh.rm(sh.glob("./slurm*"))
		f.close()
		print('dispatcher finished running')
