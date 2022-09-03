
function f = voiceFeatures(data)
F = fft(data);
plot(abs(F));
m = max(abs(F));
xPitch = find(abs(F)==m,1);
f = xPitch;