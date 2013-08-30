%Load the data and select features for classification
     
clc
clear all
[num,txt,raw]= xlsread('F:\project\fruits\workingcodesnew\svmdata45.xlsx');

meas=num(1:45,1:26);
species=txt(1:45,1);
cp = classperf(species);
for i = 1:10
    test = (indices == i); train = ~test;
    class = classify(meas(test,:),meas(train,:),species(train,:));
    classperf(cp,class,test)
end
cp.CorrectRate


indices = crossvalind('Kfold',species,10);


% load fisheriris
%        data = [meas(:,1), meas(:,2)];
%       % Extract the Setosa class
%       groups = ismember(species,'virginica');
%       % Randomly select training and test sets
%       [train, test] = crossvalind('holdOut',groups);
%       cp = classperf(groups);
%       % Use a linear support vector machine classifier
%       svmStruct = svmtrain(data(train,:),groups(train),'showplot',true);
%       classes = svmclassify(svmStruct,data(test,:),'showplot',true);
%       % See how well the classifier performed
%       classperf(cp,classes,test);
%       %cp.CorrectRate
%       cp.CorrectRate