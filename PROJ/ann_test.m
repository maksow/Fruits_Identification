%%om shri ganeshaya namah
%% neural networks - spoo 

cd('C:\Users\DULLURI\Desktop\SPOO_CHECK');
%% read database in excel 
to_classify_data=xlsread('\PROJ\DATA1.xls','master');
sample_training_data=xlsread('\PROJ\DATA1.xls','training');


group=[1:7];

%size(to_classify_data);
%size(sample_training_data);

net=newff(to_classify_data',group,[5],{'tansig'},'traingdx');

net.trainParam.epochs=10;

net.trainParam.max_fail=2;
[net,tr]=train(net,to_classify_data',group);
Y = sim(net,to_classify_data');
%plot(to_classify_data,group,to_classify_data,Y,'o')
 
%%[net,tr]=train(net,sample_training_data');
%Y = sim(net,sample_training_data');
%plot(P,group',P,Y,'o')
%plot(sample_training_data',Y,'o')

%cikis_ysa=sim(net,sample_training_data); cikis_ysa=round(cikis_ysa);

%y = sim(net,to_classify_data);
%[m,b,r] = postreg(y,to_classify_data);
%%setdemorandstream(700000008);

%%net = patternnet(10);
%view(net)

%%class = knnclassify(sample_training_data,to_classify_data, group)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [a1]=double(imread('apple.jpg','jpg'));
% [a2]=double(imread('banana.jpg','jpg'));
% [a3]=double(imread('orange.jpg','jpg'));
% 
% a1=imresize(a1,[200,200]);
% a2=imresize(a2,[200,200]);
% a3=imresize(a3,[200,200]);
% 
% a1x=ind2rgb(a1);
% a2x=ind2rgb(a2);
% a3x=ind2rgb(a3);