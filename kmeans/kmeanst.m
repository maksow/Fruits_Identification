load xxx

k=3;

x=[0.2694	0.2381	0.2076	0.2795	0.2796	0.2792	0.2792	0.2796	0.2704	0.2386	0.2086	0.2801	0.2804	0.2802	0.2801	0.2802	0.3439	0.3138	0.2722	0.347	0.3471	0.3471	0.3469	0.3472
0.3406	0.3009	0.2623	0.3531	0.3535	0.3527	0.3527	0.3535	0.2736	0.2415	0.2112	0.2833	0.2838	0.2834	0.283	0.2838	0.4507	0.4074	0.3535	0.4585	0.4587	0.4586	0.4582	0.4589
0.2331	0.206	0.1797	0.2424	0.2422	0.2421	0.2422	0.2422	0.3518	0.3102	0.2711	0.3648	0.3645	0.3648	0.3651	0.3645	0.3839	0.3488	0.3025	0.3889	0.3884	0.3887	0.389	0.3886
0.2344	0.2073	0.1807	0.243	0.2432	0.2427	0.2427	0.2432	0.1858	0.164	0.1435	0.1922	0.1927	0.1926	0.1921	0.1924	0.1971	0.1852	0.1606	0.1938	0.1941	0.1941	0.1936	0.194
27113	27160	27136	27139	27139	27119	27120	27139	25133	25151	25153	25132	25138	25135	25136	25133	27008	27748	27744	26437	26435	26438	26439	26437
0.707	0.7076	0.705	0.7075	0.7075	0.7072	0.7073	0.7075	0.3419	0.3379	0.3339	0.3436	0.3439	0.3441	0.3442	0.3437	0.8856	0.8844	0.8845	0.8883	0.8884	0.8884	0.8884	0.8883
763.8305	767.8305	764.7595	765.8305	765.8305	764.1737	763.5879	765.8305	624.9016	623.1442	622.5584	623.73	625.4874	623.73	623.73	623.73	860.5828	877.7372	877.7372	848.7838	848.1981	849.3696	849.3696	848.7838
446.0571	444.5026	445.8932	445.3188	445.3188	445.9554	446.314	445.3188	505.4085	507.1968	507.7145	506.3377	505.0357	506.3982	506.4183	506.3579	394.3752	397.262	397.2048	391.4037	391.6444	391.1486	391.1634	391.4037
132.1111	127.6667	120	168.1111	164.3333	119.5556	119.5556	168.1111	100.5556	114.3333	131.2222	166.1111	155.1111	77.2222	77.2222	166.5556	253.8889	255	233.7778	0	0	254.8889	254.8889	0];


[n,d] = size(x);
bn=round(n/k*rand);
bn=3;
%nc=[x(bn,:);x(2*bn,:);x(3*bn,:);x(4*bn,:);x(5*bn,:);x(6*bn,:);x(7*bn,:);x(8*bn,:)];
nc=[x(bn,:);x(2*bn,:);x(3*bn,:)];
[cid,nr,centers] = kmeans(x,k,nc);

for i=1:3
    if cid(i)==1,
      plot(x(i,1),x(i,2),'r*') 
      hold on
    else
     if cid(i)==2,
         plot(x(i,1),x(i,2),'b*')
         hold on
     else
         if cid(i)==3,
             plot(x(i,1),x(i,2),'g*') 
             hold on
%          else
%                if cid(i)==4,
%              plot(x(i,1),x(i,2),'k*') 
%              hold on
%                end
%                  if cid(i)==5,
%              plot(x(i,1),x(i,2),'c*') 
%              hold on
%                  end
%          if cid(i)==6,
%              plot(x(i,1),x(i,2),'y*') 
%              hold on
%          end
%                if cid(i)==7,
%              plot(x(i,1),x(i,2),'k-') 
%              hold on
%                end
%                if cid(i)==8,
%              plot(x(i,1),x(i,2),'m*') 
%              hold on
%                end
                
         end
     end
    end
end
strt=['红色*为第一类；蓝色*为第二类；绿色*为第三类；黑色*为第四类' ];
text(-4,-3.6,strt);
% x1=[0.2975
%      0.3743
%      0.3278
%       0.1905
%        20904
%         0.8739
%          753.4285
%           348.6561
%            236.0000];%bantest
     x1=c;  
% x1=[0.3034
% 0.4672
% 0.2192
% 0.2236
% 91179
% 0.4431
% 1.20E+03
% 952.4085
%  188.2222];%apptest
 sum=0;
for i=1:8
sum=sum+c{i,1};
end
 
sum1=sum/8;   
   for i=1:3
      
           dist(i)=norm(centers(i)-sum1);
   end



