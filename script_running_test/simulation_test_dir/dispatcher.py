#!/home/brando90/envs/phy/bin/python
import sh as sh

#processes = []
#for i in range(1,5):
	#ps = sbatch('worker.sh' , str(i), _bg=True )
	#processes.append(ps)
print(">>> Dispatcher about to run---")

f = open('counter.txt', 'w+')
sh.wc( sh.ls(".", "-1"), "-l",_out="counter.txt")
file_counter = int(f.readlines()[0])
print(file_counter)
print( type(file_counter) )


#for ps in processes:
#	ps.wait()
#sh.rm('./slurm*')
