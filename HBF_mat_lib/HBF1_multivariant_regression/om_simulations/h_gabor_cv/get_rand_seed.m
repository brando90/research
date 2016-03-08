function [ rand_seed ] = get_rand_seed( slurm_job_id, task_id)
%
rand_gen = rng('shuffle')
shrunk_id = rem(slurm_job_id,2^32);
current_seed = rem(rand_gen.Seed + shrunk_id,2^32);
shrunk_id = rem(task_id,2^32);
rand_seed = rem(current_seed + shrunk_id,2^32);
end