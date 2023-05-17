%Record Speech Classifier Data
%Recording 30 repetitions of data for
%training and classification purpose


numrep=30;
words={'TRUE','FALSE'};
fs=8000; %The number of samples per second
for i=1:2
    j=1;
    close all; %close all figure windows
    fprintf('Press RETURN to start recording.\nCurrent word: %s\n\n\n',words{i});
    input('');
    while (j<=numrep)
        filename=sprintf('%s%d.wav',words{i},j);
fprintf('Recording %s\n',filename);
%CODE FOR RECORDING 2s SPEECH DATA
aro=audiorecorder(fs,24,1);
disp('Start Speaking.');
recordblocking(aro,2); %END RECORDING AFTER 2s
disp('End of Recording.');
s=getaudiodata(aro,'double'); %STORING SPEECH DATA IN VARIABLE s
%CODE FOR STORING 2s SPEECH DATA AS FILE
audiowrite(filename,s,fs);

%VISUALIZING THE SPEECH SIGNAL
%PLOTTING THE GRAPH
%FREQUENCY IS CONVERTED TO TIME BY f=1/T
%SINCE fs=8000, FOR 2s WE WILL HAVE 2*8000 
%EACH OF THIS SAMPLE FREQUENCY IS CONVERTED TO TIME AND PLOTTED
%WITH THE VALUES OF VARIABLE s.
%AMPLITUDE vs TIME
plot((1:length(s))/fs,s);
xlabel('time');
ylabel('amplitude');
title(filename);

%QUALITY CHECK OF THE SIGNAL RECORDED

in=input('OK?<1 RETURN>DISMISS?<0 RETURN>');
if (in==1 ||in~=0) % IF 1 IS PRESSED ONLY THE AUDIO IS SAVED.
    j=j+1;
end
    end
end
