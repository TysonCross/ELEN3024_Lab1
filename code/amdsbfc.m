function [u] = amdsbfc(a)
syms t;
initM = cos(sym(2*pi*1e3*t));
c = cos(sym(2*pi*1e6*t));
Ac = 1;

% no need to normalise since the message is a sinusoid
m = sym(a*initM);

u = simplify(sym(Ac*(1+m)*c));

%plot
time1 = 0:1e-5:1e-2;
val1 = zeros(1, length(time1));
for i=1:length(time1)
    val1(i) = subs(initM, t, time1(i));
end

time2 = 0:1e-7:1e-4;
val2 = zeros(1, length(time2));
for i=1:length(time2)
    val2(i) = subs(u, t, time2(i));
end

figure, 
subplot(2,1,1)
plot(time1, val1);
grid on

subplot(2,1,2)
plot(time2, val2);
grid on

end

