% ELEN3024 Lab 1 - Exercise 1b
% Tyson Cross 1239448
% Jason Parry 1046955
% Rashaad Cassim 1099797

%{
    Notes and information
%}

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));
interactive =0;

%% Input
if (interactive)
    prompt = 'Enter a value for message signal amplitude: ';
    A_m = input(prompt);
    prompt = 'Enter a value for carrier signal amplitude: ';
    A_c = input(prompt);
else
    A_c = 1;
    A_m = 1;
end

%% Constants
f_m = 10000.0;                              %  message frequency in Hz
f_c = 1000000.0;                            %  carrier frequency in Hz
f_e = f_m;                                  %  envelope frequency in Hz
T_m = 1/f_m;                                %  message period in seconds
T_c = 1/f_c;                                %  carrier period in seconds
T_e = T_m;                                  %  envelope period in seconds
N = 4*f_m;                                  %  sampling rate
time_step = T_c/10;                         %  time divisions
freq_step = f_m/N;                          %  frequency divisions
t = 0.0:time_step:2*T_m;                    %  time range
f = linspace(-f_m/2,f_m/2,numel(t));        %  frequency range

%% Equations
message = A_m * cos(2 * pi * f_m * t);
carrier = A_c * cos(2 * pi * f_c * t);
message_frequency = abs(fftshift((fft(message))));

% Double Sideband with Suppressed Carrier (DSB-SC):
modulated_signal = message .* carrier;
% Product to Sum:
modulated_signal_sum = (A_c * A_m)/2 * (cos(2 * pi * (f_c - f_m) * t) ...
                    +   cos(2 * pi * (f_c + f_m) * t ) );
% Envelope:
envelope1 = A_c * message;
envelope2 = -envelope1;
modulated_frequency = abs(fftshift((fft(modulated_signal))));
% modulated_frequency = (A_c * A_m)/4 * ( dirac(f - f_c + f_m) ...
%                                       + dirac(f + f_c - f_m) )...
%                     + (A_c * A_m)/4 * ( dirac(f - f_c - f_m) ...
%                                       + dirac(f + f_c + f_m) );

%% Display results
Exercise1b_Disp;

%% Plot results
Exercise1b_Plot;