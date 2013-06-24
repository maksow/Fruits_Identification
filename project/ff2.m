clear all
clc
p=4;%hidden
m=3;%input
input=[1 2 3; 2 3 4; 4 5 6];
input=input/6;
w=[1 2 3 4; 1 2 3 4;1 2 3 4];%weights(i/p to hidden)
wn=w/4;
w1=rand(4,1);%weights (hidden to o/p)
epoch=0;
con=1;
eta=0.6;%learning rate
alpha=0.3;%momentum


t1=[0.2 0.5 0.8];
for i=1:3
    x=input(1,:);
    x=x';
    t=t1(:,1);
%feed forward

while con
for j=1:p
    for i=1:m
        tx(1,j)=x(i)*wn(i,j);
        
    end
end
A=logsig(tx);%activation function of i/p to hidden
A=A';
out=w1'*A;%output layer OUTPUT
outA=logsig(out);%activation function of o/p
%error
outputerror=(t-outA)*(1-outA)*outA;
%backward propagation of error
y=A*outputerror;
deltaw1=alpha*w1+eta*y;%change in weight
%error
e1=w1*outputerror;
dstar=e1.*A.*(1-A);
absx=dstar*x';
absdeltaV=alpha*w'+eta*absx;
%weight update input to hidden layer
wupdate=w'+absdeltaV;
%weight update hidden layer to outputlayer
w1update=w1+deltaw1;
e=outputerror;
e=abs(e);
%error condition
if e<0.00005
 con=0;   
else
epoch=epoch+1
end
w=wupdate';
w1=w1update;
end
end

