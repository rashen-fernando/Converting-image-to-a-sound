xx = imread("E:\projects\Converting images to songs\1649653081_gotabaya.jpg");
[s,Fs]=audioread("E:\projects\Converting images to songs\song.ogg");
s=s(:,1);
x1 = double(xx(:,:,1))/10^10;
x2 = double(xx(:,:,2))/10^10;
x3 = double(xx(:,:,3))/10^10;

x1 = x1-mean(x1);
x2 = x2 -mean(x2);
x3 = x3 -mean(x3);
%876
pic = complex(x1,x2);
pic2 = complex(x3,(x1+x2)/2);
pic = reshape(pic,100,[]);
pic2 = reshape(pic2,100,[]);
pic = repmat(pic,1,114);
pic2=pic2(:,1:(size(spectro,2)-size(pic,2)));
pic = cat(2,pic,pic2);

% nsemitones = 100;
% audioOut = shiftPitch(song,nsemitones);
% sound(audioOut,Fs)

%spectro = stft(s,Fs,'Window',kaiser(50,5),'OverlapLength',30,'FFTLength',100);
%[song,t] = istft(pic,Fs,'Window',kaiser(50,5),'OverlapLength',30,'FFTLength',100);
%[song2,t2] = istft(spectro,Fs,'Window',kaiser(50,5),'OverlapLength',30,'FFTLength',100);

song = song +conj(song);
plot(t(1000:end),song(1000:end))