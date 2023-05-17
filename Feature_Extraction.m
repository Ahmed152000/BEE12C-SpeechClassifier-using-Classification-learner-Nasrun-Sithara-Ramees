%Feature Extraction Speech Classification Data
%Extracting and Display of LPC Coefficients
clc;
numrep=30;
words={'TRUE','FALSE'};
numLPC=10; %No of LPC Coefficients extracted

%Initializing the Feature Extraction Matrix
x=zeros(2*numrep,numLPC); %60rows and 10 columns
%Initializing label matrix
y=zeros(2*numrep,1); %This is useful in identifying each audioclip with a number
                     % TRUE=0 & FALSE=1

k=1;
for i=1:2;
    for j=1:numrep
        filename=sprintf('%s%d.wav',words{i},j);
        %CODE TO READ DATA FROM FILENAME
        [sig,Fs]=audioread(filename);

        %EXTRACTING FEATURES (10 LPC Co-eFs)
        a=lpc(sig,10);
        %STORING LPC Co-eFs in x
        x(k,:)=a(2:end);
        y(k)=(i-1);

        %ENTER CODE TO VISUALIZE LPC Co-eFs

      fprintf('Visualization features of %s\n', filename);
      disp('Displaying the LPC Co-efficients');
      disp('a');

      %Just break to visualize

      k=k+1;
    end
end

%Attaching the Label Matrix to the Feature Matrix

featurematrix=[x y];

%Store the features
%Saving the featurematrix data in the current folder from the workspace
%with name SpeechClassifierData
save('SpeechClassifierData','featurematrix');










 
    










