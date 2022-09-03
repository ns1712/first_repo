
clc;
clear all;
A=1;
B=3;
Fs = 15000 + 100*A + 50*B;
data=[];
figure;
[data1 Fs] = audioread('test1.wav');
plot(data1);
figure;
[data2 Fs] = audioread('test2.wav');
plot(data2);
figure;
[data3 Fs] = audioread('test3.wav');
plot(data3);
figure;
[data4 Fs] = audioread('test4.wav');
plot(data4);
figure;
[data5 Fs] = audioread('test5.wav');
plot(data5);
figure;
[data6 Fs] = audioread('C:\Users\Nimi\Desktop\group3\AUD-20211127-WA0007.wav');
plot(data6);
figure;
stem(data1);
%%declaring echo - coefficients
h = [ 1 0 0.4 0 0 0.2];
echoed_out = conv(data1 , h);
figure;
stem(echoed_out);
%sound(echoed_out,Fs);
%soundsc(echoed_out,Fs);
% declaring given filter coefficient to remove echoe
gn = [ 1 -0.5];
vn = conv(echoed_out,gn);
figure;
stem(vn);
%soundsc(vn,Fs);
%designing optimum filter to remove echoes
k = fft(h);
g_opt_f = 1./k;

g_opt = ifft(g_opt_f);
% lets see if its removed by convolution with optimum filter designed above
v_optn = conv(echoed_out ,g_opt);
figure;
stem(v_optn);