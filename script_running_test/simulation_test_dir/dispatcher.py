#!/home/brando90/envs/phy/bin/python
import sh as sh

for i in range(1,5):
	sh.Command('sbatch hello_world_worker.sh '+str(i))
