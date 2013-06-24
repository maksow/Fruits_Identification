clear;
clc;
cd=open('reg.mat');

A=cd.input_data(1,:);
B=cd.input_data(2,:);
C=cd.input_data(3,:);
D=cd.input_data(4,:);
E=cd.input_data(5,:);
F=cd.input_data(6,:);
G=cd.input_data(7,:);
H=cd.input_data(8,:);
I=cd.input_data(9,:);
J=cd.input_data(10,:);
K=cd.input_data(11,:);
L=cd.input_data(12,:);
M=cd.input_data(13,:);
N=cd.input_data(14,:);
O=cd.input_data(15,:);

input=[A' B' C' D' E' F' G' H' I' J']';
%input=()
for i=1:10
    for j=1:10
        if i==j
            output(i,j)=1;
        else
             output(i,j)=0;
        end
    end
end
for i=1:10
    for j=1:2
        if j==1
            aw(i,j)=0;
        else
             aw(i,j)=1;
        end
    end
end
%cd.input_data(10:15,:)';


test=[K' L' M' N' O']';
net=newp(aw,10,'hardlim');
net.trainparam.epochs=1000;
net.trainparam.goal=0;
net=train(net,input,output);
y=sim(net,[K' L' M' N' O']);
%y=sim(net.test);
x=y';
for i=1:5
    k=0;
    l=0;
    for j=1:10
        if x(i,j)==1
            k=k+1;
            l=j;
        end
    end
    if k==l
        s=sprintf('test pattern %d is recognised as %d',i,i-1);
        disp(s);
    else
         s=sprintf('test pattern %d is not recognised',i);
        disp(s);
    end
end

        
        
