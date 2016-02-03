%%collect results
files = dir('./results/results_job_debug1_2_feb_2016/*.m');
centers = zeros(1,5); %TODO
test_errors = zeros(1,5); %TODO
i=1;
for file = files'
    name = file.name;
    path=sprintf('./results/results_job_debug1_2_feb_2016/%s',name);
    run(path);
    centers(i) = center;
    test_errors(i) = test_error;
    i=i+1;
end
centers
test_errors