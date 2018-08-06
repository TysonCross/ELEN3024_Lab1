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
    A_c = 1.0;
    A_m = 1.0;
end

%% Constants
f_m = 10000.0;                              %  message frequency in Hz
f_c = 1000000.0;                            %  carrier frequency in Hz
f_e = f_m;                                  %  envelope frequency in Hz
T_m = 1/f_m;                                %  message period in seconds
T_c = 1/f_c;                                %  carrier period in seconds
T_e = T_m;                                  %  envelope period in seconds
plot_length = 2*T_m;                        %  length of plot (x-axis)

% output message sampling
mult = 2*100;                               %   oversampling
f_s = mult*f_c;                             %  sample / second (sample freq)
dt = 1.0/f_s;                               %  seconds / sample (time-step)
t = 0:dt:plot_length;                       %  time range
N = numel(t);                               %  number of samples
f = linspace(-f_s/2,f_s/2,N);               %  frequency range

%% Equations
message = A_m * cos(2 * pi * f_m * t);
carrier = A_c * cos(2 * pi * f_c * t);

% Double Sideband with Suppressed Carrier (DSB-SC):
modulated_signal = message .* carrier;

% Envelope:
envelope1 = A_c * message;
envelope2 = -envelope1;

% Frequency
message_frequency = (A_m/N)  * abs(fftshift((fft(message))));
modulated_frequency = (A_c*A_m/N)  * abs(fftshift((fft(modulated_signal))));
f_message = [-f_m 0 f_m];
f_output = [-f_c-f_m -f_c+f_m 0 f_c-f_m f_c+f_m];

%% Display results
Exercise1b_Disp;

%% Plot results
Exercise1b_Plot;

% export image
% export_fig ('../Report/images/Exercise1b.eps',fig1)
