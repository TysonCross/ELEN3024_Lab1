% Display results
disp(' ');
disp(['Lab 1 - Exercise 1b ', num2str(N)]);

disp(' ');disp(' ');
T1 = table ({'Message';'Carrier'}, {f_m;f_c}, {T_m;T_c});
T1.Properties.VariableNames = {'Signal','Frequency','Period'};
T1.Properties.Description = 'Signal ';
disp(['  ',T1.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T1)
