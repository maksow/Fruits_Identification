clear all
clc
input=[0.35 0.9];
weight1=[0.1 0.8];
weight2=[0.4 0.6];
weight3=0.3;
weight4=0.9;
t=0.5;
sum1=0;
sum2=0;
sum=0;
for i=1:2
    sum1=sum1+input(i)*weight1(1,i);
    A1=logsig(sum1);
    sum2=sum2+input(i)*weight2(1,i);
    A2=logsig(sum2);
    output=sum+A1*(weight3)+A2*(weight4);
    Aout=logsig(output);
    outputerror=(t-Aout)*(1-Aout)*Aout;
    
end