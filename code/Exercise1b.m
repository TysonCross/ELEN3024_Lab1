% ELEN3024 Lab 1 - Exercise 1b
% Tyson Cross 1239448
% Jason Parry 1046955
% Rashaad Cassim 1099797

%{
    Notes and information
%}

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));

%% Input
prompt = 'Enter a value for message signal amplitude: ';
A_m = input(prompt);
prompt = 'Enter a value for carrier signal amplitude: ';
A_c = input(prompt);
% A_c = 1;
% A_m = 1;

%% Constants
f_m = 10000.0;
f_c = 1000000.0;
T_m = 1/f_m;
T_c = 1/f_c;
t = 0.0:T_c/10:2*T_m;

%% Equations
message = A_m * cos(2 * pi * f_m * t);
carrier = A_c * cos(2 * pi * f_c * t);
modulated_signal = message .* carrier;
% Product to Sum:
% modulated_signal = (A_c * A_m)/2 * (cos(2 * pi * (f_c - f_m) * t) ...
%                     +   cos(2 * pi * (f_c + f_m) * t ) );

% Display results
% Exercise1b_Disp;

% Plot results
Exercise1b_Plot;