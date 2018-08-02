% Display results
disp(' ');
disp(['Lab 1 - Exercise 1b ', num2str(N)]);

disp(' ');disp(' ');
T1 = table ({'Message';'Carrier';'Envelope'},...
    {[num2str(f_m) ' Hz']; [num2str(f_c) ' Hz'];[num2str(f_e) ' Hz']},...
    {[num2str(T_m) ' seconds']; [num2str(T_c) ' seconds']; [num2str(T_e) ' seconds']});
T1.Properties.VariableNames = {'Signal','Frequency','Period'};
T1.Properties.Description = 'Signal ';
disp(['  ',T1.Properties.Description, ':']);
disp(' ');
feature('HotLinks',false);  % disable bold headers 
disp(T1)
