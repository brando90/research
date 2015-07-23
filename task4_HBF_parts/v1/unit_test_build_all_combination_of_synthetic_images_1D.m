%% Unit test build_all_combination_of_synthetic_images_1D
%% Test 1
num_parts = 4;
p1 = [1; 2; 3 ];
p2 = [5; 6; 7 ];
p3 = [9; 10; 11];
p4 = [13; 14; 15];
[D, ~] = size(p1);
parts = zeros(D, num_parts);
parts(:, 1) = p1;
parts(:, 2) = p2;
parts(:, 3) = p3;
parts(:, 4) = p4;
[X_data, X_tensor] = build_all_combination_of_synthetic_images_1D(parts,num_parts,D);
disp(X_data)
disp(X_tensor)
%% Test 2
%% Unit test build_all_combination_of_synthetic_images_1D
num_parts = 4;
p1 = [0; 0; 0 ];
p2 = [5; 6; 7 ];
p3 = [9; 10; 11];
p4 = [13; 14; 15];
[D, ~] = size(p1);
parts = zeros(D, num_parts);
parts(:, 1) = p1;
parts(:, 2) = p2;
parts(:, 3) = p3;
parts(:, 4) = p4;
%%
[X_data, X_tensor] = build_all_combination_of_synthetic_images_1D(parts,num_parts,D);
disp(X_data)
disp(X_tensor)