%%Predicting for a new audio input Data

clc;
clear x;

%load linear_svm;
%Defining Sampling rate
fs=8000;
%Start Recording
aro=audiorecorder(fs,24,1);
disp('Start Speaking');
recordblocking(aro,2);
disp('End of Recording.');

%Get Audio Data
sig=getaudiodata(aro,'double');

%Visualize

figure(1); clf;

plot((1:length(sig))/fs,sig);
xlabel('time');
ylabel('Amplitude');

%Extracting Coefficients
a=lpc(sig,10);
x=a(2:end);

%Testing the Classifier
pred=linear_svm.predictFcn(x);

%Printing Predicted output
if pred==0

    disp('Predicted Value is "TRUE"');
elseif pred==1
    disp('Predicted value is FALSE');
else 
    disp('Could not recognize');
    return;
end
