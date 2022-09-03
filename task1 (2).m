clc;
clear all;
A=1; % group number
B=3; %Section number
Fs = 15000 + 100*A + 50*B;  %sampling rate
ch = 1;  % channel 1 for mono
datatype = 'uint8';
nbits = 8;
Nseconds = 20;   %duration of audio 
recorder = audiorecorder(Fs,nbits,ch);
pause(3); 
disp('Start Speaking..');
recordblocking(recorder,Nseconds);
disp("End of Recording");
x = getaudiodata(recorder); %audio data
audiowrite('test.wav',x,Fs);
play(recorder,Fs+1000);  
plot(x);
%%feature extraction 
 f = voiceFeatures(x);
 %%save users data
 uno = input('Enter the user number');
 
 try
     load voiceData
     F = [F ;f];
     C = [C;uno];
     save voiceData
 catch
     F = f;
     C = uno;
     
     save voiceData F C
 end
 msgbox('Your voice Registered');
 
 
 
     