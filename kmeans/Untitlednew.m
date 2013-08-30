
clc
clear all
close all
%features of mean,R-mean,G-mean,B-mean,area,centroid,eccentricity,perimeter,compactness
x=xlsread('fruitdbedit.xlsx');


% z=x(:,5);
% temp=x(:,10);
% x(:,5)=temp;
% x(:,10)=z;
P=x(1:140,1:25);
T=x(1:140,26);
a=x(141:150,1:25);
s=x(141:150,26);
% P=x(1:6,1:9);
% T=x(1:6,10);
% a=x(7:10,1:9);
% s=x(7:10,10);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
[an,mina,maxa,sn,mins,maxs]=premnmx(a',s');
net1=newff(minmax(pn),[150 1],{'tansig','tansig'},'traingdm');
net1.trainParam.epochs=3000;
net1.trainParam.lr=0.3;
net1.trainParam.mc=0.6;
net1=train (net1,pn,tn);
y=sim(net1,an);
t=postmnmx(y',mins,maxs);
save bbb

