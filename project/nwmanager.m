%back propagation network for data compression
clc;
clear;
%get input pattern from file
data=open('comp.mat');
x=data.input;
t=data.t1;
