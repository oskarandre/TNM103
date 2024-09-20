[y,Fs] = audioread("Fiska.wav");
from = 33;
to = 46;
originalSound = y(from*Fs:to*Fs,:);
originalSound = originalSound(:,1);

%playerOg = audioplayer(originalSound,Fs);



%sound(phaseVocodedSound,Fs);


windowSize = Fs*0.2;
speed = 1.3;
stepSize = round(windowSize*speed);

pitch=0.7;

if pitch == 1
    Fs2 = Fs;
else
    Fs2 =Fs*pitch;
end

newFrame =zeros(round(length(originalSound)*(windowSize/stepSize)+windowSize),1);
k=1;
for i = (0:stepSize:length(originalSound)-1)
    for j = (0:windowSize-1)
        newFrame(k) = (i+j+1);
        k = k+1;
    end
end

%klipper nollor
ix = newFrame > 0;
newFrame = newFrame(ix);

%kolla längden
ix =newFrame<length(originalSound);
newFrame = newFrame(ix);

phaseVocodedSound=originalSound(newFrame);

player = audioplayer(phaseVocodedSound,Fs2);

play(player);

figure;
subplot(211);
plot(originalSound);
title('Original');
subplot(212);
plot(phaseVocodedSound);
title('Phase vocoded');
 %%

