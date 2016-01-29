#!/home/brando90/envs/phy/bin/python
import sh as sh

#processes = []
#for i in range(1,5):
	#ps = sbatch('worker.sh' , str(i), _bg=True )
	#processes.append(ps)

#print(sh.echo('done with dispatcher.py script'))

#while count != 5

# = queue.Queue()
#x = sh.wc( sh.ls(".", "-1"), "-l", _out=q)
#print( type(x) )got
print(">>> Dispatcher about to run \n")

#print(sh.wc(sh.ls("/etc", "-1"), "-l"))

f = open('counter.txt', 'w+')
print(f)
sh.wc( sh.ls(".", "-1"), "-l",_out="counter.txt")
#print( sh.ls(".", "-1") )
print('-------hello')
print(f.readlines() )


#for ps in processes:
#	ps.wait()
#sh.rm('./slurm*')
