%back propagation network for data compression
clc;
clear;
%get input pattern from file
data=open('comp.mat');
x=data.input;
x=x';

t=data.t1;
net=newp(x,t,'hardlim');
net.trainparam.epochs=20000;
net.trainparam.goal=0;
net=train(net,x,t);
y=sim(net,x);
save aaa

         
