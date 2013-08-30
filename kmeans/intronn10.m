
clc
clear all
close all
%features of mean,R-mean,G-mean,B-mean,area,centroid,eccentricity,perimeter,compactness
 
x=[0.2604 0.3292 0.2255 0.2266 27128 117.4464 124.8755 0.7076 762.6589 446.9894;
    
   0.2425 0.2873 0.2527 0.1874 18984 132.7716 99.0824 0.8054 594.0071 401.6113;
   
   0.2432 0.3077 0.2105 0.2114 27117 120.8339 128.7139 0.7061 765.3452 445.2399;
   
   0.2305 0.2913 0.1996 0.2005 27166 124.1040 132.3169 0.7060 764.0732 446.7871;
   
   0.2277 0.2698 0.2372 0.1763 19024 135.8764 103.0597 0.8075 596.0071 401.1070;
   
   0.2140 0.2535 0.2230 0.1655 19038 138.9534 107.1367 0.8069 593.0782 403.3845;
   
   0.2189 0.2765 0.1897 0.1905 27173 127.2196 135.7271 0.7072 763.4874 447.2451;
   
   0.2033 0.2407 0.2117 0.1575 19111 141.8381 111.2539 0.8061 591.9066 405.7328;
   
   0.2076 0.2623 0.1797 0.1807 27136 130.0794 139.1228 0.7050 764.7595 445.8932;
   
   0.1925 0.2279 0.2006 0.1491 19076 144.5392 115.2460 0.8055 590.2498 406.1265];%RGB means&shape features of 10 fruits


z=x(:,5);
temp=x(:,10);
x(:,5)=temp;
x(:,10)=z;
  
P=x(1:6,1:9);
T=x(1:6,10);
a=x(7:10,1:9);
s=x(7:10,10);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
[an,mina,maxa,sn,mins,maxs]=premnmx(a',s');
net=newff(minmax(pn),[7 1],{'tansig','tansig'},'traingdm')
net.trainParam.epochs=3000;
net.trainParam.lr=0.3;
net.trainParam.mc=0.6;
net=train (net,pn,tn);
y=sim(net,an);
t=postmnmx(y',mins,maxs);
save bbb

