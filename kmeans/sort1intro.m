
clc
clear all
load bbb
%t1=x(141,26)
t1=x(7,:);
t1(1,10)=t(1,1);
for i=1:4
    for j=1:6
dist(j,i)=norm(x(j,10)-t1(i));
    end
end
[val idx]=sort(dist,'ascend')