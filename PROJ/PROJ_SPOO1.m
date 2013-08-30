%% om shri ganeshaya namah
%% fruit recognition paper - as on 10th aug 2013
cd('C:\SPOORTHI_LAB\PROJ\PROJ');
%% read database in excel 
to_classify_data=xlsread('DATA.xls','master');
sample_training_data=xlsread('DATA.xls','training');

group=[1:7]';

class = knnclassify(sample_training_data,to_classify_data, group)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [a1]=double(imread('apple.jpg','jpg'));
% [a2]=double(imread('banana.jpg','jpg'));
% [a3]=double(imread('orange.jpg','jpg'));
% 
[a1]=imread('apple.jpg');
[a2]=imread('banana.jpg');

[a3]=imread('watermelon2.jpg');
[a4]=imread('orange.jpg');

[a5]=imread('watermelon.jpg');

% a1=imresize(a1,[200,200]);
% a2=imresize(a2,[200,200]);
% a3=imresize(a3,[200,200]);

a1x=im2bw(a1);
a2x=im2bw(a2);
a3x=im2bw(a3);
a4x=im2bw(a4);
a5x=im2bw(a5);


ea1=edge(a1x);
ea2=edge(a2x);
ea3=edge(a3x);
ea4=edge(a4x);

ea5=edge(a5x);

area1=bwarea(a1x);
area2=bwarea(a2x);
area3=bwarea(a3x);
area4=bwarea(a4x);
area5=bwarea(a5x);


perim1=bwarea(ea1);
perim2=bwarea(ea2);
perim3=bwarea(ea3);
perim4=bwarea(ea4);
perim5=bwarea(ea5);


f1r=mean2(a1(:,:,1));
f2r=mean2(a2(:,:,1));
f3r=mean2(a3(:,:,1));
f4r=mean2(a4(:,:,1));
f5r=mean2(a5(:,:,1));

f1g=mean2(a1(:,:,2));
f2g=mean2(a2(:,:,2));
f3g=mean2(a3(:,:,2));
f4g=mean2(a4(:,:,2));
f5g=mean2(a5(:,:,2));

f1b=mean2(a1(:,:,3));
f2b=mean2(a2(:,:,3));
f3b=mean2(a3(:,:,3));
f4b=mean2(a4(:,:,3));
f5b=mean2(a5(:,:,3));


shape1=4*(22/7)*(area1/perim1^2);
shape2=4*(22/7)*(area2/perim2^2);
shape3=4*(22/7)*(area3/perim3^2);
shape4=4*(22/7)*(area4/perim4^2);
shape5=4*(22/7)*(area5/perim5^2);


%%MIN_RED	MIN_BLUE	MIN_GREEN	MAX_RED	MAX_BLUE	MAX_GREEN	MIN_AREA	MAX_AREA	MIN_PERIM	MAX_PERIM	MIN_SHAPE	MAX_SHAPE	FRUIT
e1=0.05;
f1=[f1r-e1,f1b-e1,f1g-e1,f1r+e1,f1b+e1,f1g+e1,area1-e1,area1+e1,perim1-e1,perim1+e1,shape1-e1,shape1+e1];
f2=[f2r-e1,f2b-e1,f2g-e1,f2r+e1,f2b+e1,f2g+e1,area2-e1,area2+e1,perim2-e1,perim2+e1,shape2-e1,shape2+e1];
f3=[f3r-e1,f3b-e1,f3g-e1,f3r+e1,f3b+e1,f3g+e1,area3-e1,area3+e1,perim3-e1,perim3+e1,shape3-e1,shape3+e1];
f4=[f4r-e1,f4b-e1,f4g-e1,f4r+e1,f4b+e1,f4g+e1,area4-e1,area4+e1,perim4-e1,perim4+e1,shape4-e1,shape4+e1];


f5=[f5r-e1,f5b-e1,f5g-e1,f5r+e1,f5b+e1,f5g+e1,area4-e1,area4+e1,perim4-e1,perim4+e1,shape4-e1,shape4+e1];

finp=[f1;f2;f3;f4];
%%class = knnclassify(finp,to_classify_data, group)
grp=[1:4]';
class_1 = knnclassify(f5,finp, grp)


