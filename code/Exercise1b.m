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
sample_rate = T_c/10;
N = f_c;
t = 0.0:sample_rate:2*T_m;
f = 0:f_c;
%% Equations
message = A_m * cos(2 * pi * f_m * t);
carrier = A_c * cos(2 * pi * f_c * t);

% Double Sideband with Suppressed Carrier (DSB-SC):
modulated_signal = message .* carrier;
% Product to Sum:
modulated_signal_sum = (A_c * A_m)/2 * (cos(2 * pi * (f_c - f_m) * t) ...
                    +   cos(2 * pi * (f_c + f_m) * t ) );
% Envelope:
envelope1 = A_c * message;
envelope2 = -envelope1;
% modulated_frequency = (A_c * A_m)/4 * ( dirac(f - f_c + f_m) ...
%                                       + dirac(f + f_c - f_m) )...
%                     + (A_c * A_m)/4 * ( dirac(f - f_c - f_m) ...
%                                       + dirac(f + f_c + f_m) );
modulated_frequency = abs(fft(modulated_signal));%,(1/sample_rate)/2));
% Display results
% Exercise1b_Disp;

% Plot results
Exercise1b_Plot;