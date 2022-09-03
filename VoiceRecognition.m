clc;
clear all;
A=1;
B=3;
Fs = 15000 + 100*A + 50*B;
ch = 1;
datatype = 'uint8';
nbits = 8;
Nseconds = 5;
recorder = audiorecorder(Fs,nbits,ch);
disp('Start Speaking..');
recordblocking(recorder,Nseconds);
disp("End of Recording");
x = getaudiodata(recorder);
audiowrite('test.wav',x,Fs);
% play(recorder,Fs+1000);
plot(x);
%feature extraction 
 f = voiceFeatures(x);
%% voiceRecognition 
load voiceData
D = [];
for(i=1:size(F,1))
    d = sum(abs(F(i)-f));
    D= [D d];
end
%%smallest Distance
sm = inf;
ind = -1;
for i = 1:length(D)
    if(D(i)<sm)
        sm =D(i);
        ind = i;
    end
end
detected_class = C(ind);