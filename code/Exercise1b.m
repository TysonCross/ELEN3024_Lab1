% ELEN3024 Lab 1 - Exercise 1b
% Tyson Cross 1239448
% Jason Parry 1046955
% Rashaad Cassim 1099797

%{
    Notes and information
%}

clc; clear all; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));

%% Input
% prompt = 'Enter a value for A_c: ';
% A_c_value = input(prompt);
% prompt = 'Enter a value for A_m: ';
% A_m_value = input(prompt);
A_c_value = 1;
A_m_value = 1;

%% Constants
f_m = 10000.0;
f_c = 1000000.0;
T_m = 1/f_m;
T_c = 1/f_c;
x = 0.0:T_c/10:T_m;

%% Equations
syms A_m A_c t;
m(t) = A_m * cos(2 * sym(pi) * f_m * t);
c(t) = A_c * cos(2 * sym(pi) * f_c * t);
u(t) = m.*c;
% Product to Sum:
% u(t) = (A_c * A_m)/2 * (cos(2 * sym(pi) * (f_c - f_m) * t) ...
%                     +   cos(2 * sym(pi) * (f_c + f_m) * t ) );

message = double(subs(m, {A_c, A_m, t}, {A_c_value, A_m_value, x}));
carrier = double(subs(c, {A_c, A_m, t}, {A_c_value, A_m_value, x}));
modulated_signal = subs(u, {A_c, A_m, t}, {A_c_value, A_m_value, x});

% Display results
% Exercise1b_Disp;

% Plot results
Exercise1b_Plot;