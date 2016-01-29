#!/home/brando90/envs/phy/bin/python
import sh as sh


for i in range(1,5):
	sh.sbatch('worker.sh' , str(i))

print(sh.echo('done with dispatcher.py script'))
