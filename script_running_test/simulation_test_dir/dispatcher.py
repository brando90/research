#!/home/brando90/envs/phy/bin/python
import sh as sh
import queue as queue
#processes = []
#for i in range(1,5):
	#ps = sbatch('worker.sh' , str(i), _bg=True )
	#processes.append(ps)

#print(sh.echo('done with dispatcher.py script'))

#while count != 5

q = queue.Queue()
x = sh.wc( sh.ls(".", "-1"), "-l", _out=q)
print( type(x) )


#for ps in processes:
#	ps.wait()
#sh.rm('./slurm*')
