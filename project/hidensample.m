clear all
clc
input=[0.35 0.9 0.6];
n=3,p=2;m=4;
w1=rand(n,p);
w2=rand(p,n);
w3=rand(m,p);
b1=rand(1,10);
%weight2=[0.4 0.6];
%weight3=0.3;
%weight4=0.9;
t=0.5;
% sum1=0;sum2=0; sumn=0;
% for i=1:n
%     sum1=sum1+input(i)*w1(1,i);
%     A1=logsig(sum1);
%     sum2=sum2+input(i)*w2;
%     A2=logsig(sum2);
%     sumn=sumn+input(i)*w3; 
%     output=sum+A1*(weight3)+A2*(weight4);
%     Aout=logsig(output);
%     outputerror=(t-Aout)*(1-Aout)*Aout;
% end

for I=1:n
    for j=1:m
        zin(j)=b1(j);
        for i=1:p
            zin(j)=zin(j)+input(i,I)*w1(i,j);
        end
        z(j)=logsig(zin(j));
    end
end
    