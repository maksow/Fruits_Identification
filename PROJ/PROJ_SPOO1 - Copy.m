%% om shri ganeshaya namah
%% fruit recognition paper - as on 10th aug 2013
cd('C:\Users\DULLURI\Desktop\SPOO_CHECK');
%% read database in excel 
to_classify_data=xlsread('\PROJ\DATA.xls','master');
sample_training_data=xlsread('\PROJ\DATA.xls','training');

group=[1:7]';

class = knnclassify(sample_training_data,to_classify_data, group)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[a1]=double(imread('apple.jpg','jpg'));
[a2]=double(imread('banana.jpg','jpg'));
[a3]=double(imread('orange.jpg','jpg'));

a1=imresize(a1,[200,200]);
a2=imresize(a2,[200,200]);
a3=imresize(a3,[200,200]);

a1x=ind2rgb(a1);
a2x=ind2rgb(a2);
a3x=ind2rgb(a3);