
clc
irows=3;
hiddennodes=3;
x=[0.6 0.8 0]';
v=[2 1 0;1 2 2;0 3 1];
w=[-1 1 2]';v0=[0 0 -1]';w0=-1;
  sumx=0;
%     for i=1:hiddennodes
for i=3:3
    for j=1:irows
         sumx=sumx+v(j,i)*x(j,1);  
         yj(i,1)=sumx;
%          i=i+1;
    end
end

yj=yj+v0;
z=logsig(yj);

sumx1=0;
for i=1:1
    for j=1:irows
         sumx1=sumx1+(w(j,1)*z(j,1))+w0;  
         yj(i,1)=sumx1;

    end
end


