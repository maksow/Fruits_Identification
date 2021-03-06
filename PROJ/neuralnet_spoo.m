%% om shri ganeshaya namah
%% fruit recognition paper - as on 10th aug 2013
cd('C:\SPOORTHI_LAB\PROJ\PROJ');
%% read database in excel 
train1=xlsread('DATA1.xls','TRAIN');
tgt=xlsread('DATA1.xls','TARGET');
test=xlsread('DATA1.xls','tst');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by NPRTOOL
%
% This script assumes these variables are defined:
%
%   cancerInputs - input data.
%   cancerTargets - target data.


% Create a Pattern Recognition Network
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);


% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;


% Train the Network
[net,tr] = train(net,train1',tgt');

% Test the Network
outputs = net(train1');
errors = gsubtract(tgt',outputs);
performance = perform(net,tgt',outputs);
y1=sim(net,test');
% View the Network
% view(net)
% 
% % Plots
% % Uncomment these lines to enable various plots.
% figure, plotperform(tr)
% figure, plottrainstate(tr)
% figure, plotconfusion(tgt,outputs)
% figure, ploterrhist(errors)

