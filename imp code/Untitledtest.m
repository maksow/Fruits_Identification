
clf
clear all
close all
clc
load bbb
%features of mean,R-mean,G-mean,B-mean,area,centroid,eccentricity,perimeter,compactness
num=xlsread('fruitdb15.xlsx');
x=xlsread('fruitdbedit.xlsx');
P=x(1:140,1:25);
T=x(1:140,26);
a=x(141:150,1:25);
s=x(141:150,26);


for i=1:140
    trainx(i,:)=x(i,18:26);
end
for j=1:10
    testx(j,:)=num(j,1:9);
end


%x2=testx(1,:);
x2=testx(5,:);
for i=1:140
dist(1,i)=norm(trainx(i,:)-x2);
    %dist(1,i)=norm(x(i,23:26)-x2);%num(12,6:9));
end
 [val idx]=sort(dist,'ascend');
 sortorder=idx(1:14);
save bbb123


% P=x(1:140,1:25);
% T=x(1:140,26);
% a=x(141:150,1:25);
% s=x(141:150,26);
% % P=x(1:6,1:9);
% % T=x(1:6,10);
% % a=x(7:10,1:9);
% % s=x(7:10,10);
% [pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
% [an,mina,maxa,sn,mins,maxs]=premnmx(a',s');
% net1=newff(minmax(pn),[150 1],{'tansig','tansig'},'traingdm');
% net1.trainParam.epochs=3000;
% net1.trainParam.lr=0.3;
% net1.trainParam.mc=0.6;
% net1=train (net1,pn,tn);
% y=sim(net1,an);
% t=postmnmx(y',mins,maxs);
 %save bbb

