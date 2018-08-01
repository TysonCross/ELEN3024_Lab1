%Amplitude Modulation with multitone signal and its spectrum analysis
%Show the time domain and frquency domain representation of DSB-AM and
%DSB-SC modulations

fc  = 1000000;  %Carrier Frequency
fm = 10000;   %message signal frequency

N = 2*fc;   %N point FFT N>fc to avoid freq domain aliasing
fs = 128; % sample frequency
t = (0:N-1)/fs;




Ec  = 1;    %Carrier Amplitude
Em1 = 1;    %message signal amplitudes
% Try changing the message and carrier amplitudes to see the effect in
% DSB-AM modulation

%---------Double SideBand Full Carrier Modulation (DSB-FC(AM))
A  =  Ec + Em1*cos(2*pi*fm*t) ;         %Envelope/eliminate the carrier amplitude
u  = A.*[cos(2*pi*fc*t)];              	%to convert DSB-AM to DSB-SC         
Mf = 2/N*abs(fft(u,N));
f = fs * (0 : N/2) / N;    %Since the fft result is symmetrical, only the positive half is sufficient for spectral representation

close all;

figure('Name','Time/Fequency domain representations of DSB-AM signals');
subplot(2,1,1); %Time domain plot
plot(t(1:N/2),u(1:N/2),t(1:N/2),A(1:N/2),'r',t(1:N/2),-A(1:N/2),'r');
title('Time Domain Representation');
xlabel('Time'); ylabel('Modulated signal');

subplot(2,1,2); %Frequency Domain Plot
plot(f(1:256),Mf(1:256));
title('Frequency Domain Representation');
xlabel('Frequency (Hz)'); ylabel('Spectral Magnitude');

%----------Double SideBand Suppressed Carrier DSB-SC----------

A  =   Em1*cos(2*pi*fm*t) ; %Envelope/eliminate the carrier amplitude
u  = A.*[cos(2*pi*fc*t)];   %to convert DSB-AM to DSB-SC         
Mf = 2/N*abs(fft(u,N));

figure('Name','Time/Fequency domain representations of DSB-SC signals');
subplot(2,1,1); %Time domain plot
plot(t(1:N/2),u(1:N/2),t(1:N/2),A(1:N/2),'r',t(1:N/2),-A(1:N/2),'r');
title('Time Domain Representation');
xlabel('Time'); ylabel('Modulated signal');

subplot(2,1,2); %Frequency Domain Plot
plot(f(1:256),Mf(1:256));
title('Frequency Domain Representation');
xlabel('Frequency (Hz)'); ylabel('Spectral Magnitude');
text(15,60,'Carrier');
%--------------------------------------------------------------------