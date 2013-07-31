clc
load bbb123
for i=1:140  %training images loop
path = strcat(strcat('train',num2str(i),'.jpg'));
    im = imread(path);
end
% figure,imshow(im);
for j=1:10
    path = strcat(strcat('test',num2str(j),'.jpg'));
end
for i=1:140
    trainx(i,:)=x(i,18:26);
end
for j=1:10
    testx(j,:)=num(j,1:9);
end

for j=5
itest=imread(strcat(strcat('test',num2str(j),'.jpg')));%Concatenate strings horizontally
end
 subplot(1,2,1); imshow( itest)
 x2=testx(5,:);
% for i=1:140
% dist(1,i)=norm(trainx(i,:)-x2);
% end
%  [val idx]=sort(dist,'ascend');
%  sortorder=idx(1:14)
for i=1:140
dist(1,i)=norm(trainx(i,:)-x2);
    %dist(1,i)=norm(x(i,23:26)-num(11,6:9));
end
 [val idx]=sort(dist,'ascend');
 sortorder=idx(1:14)
 for ix=1:14
itrain= strcat(strcat('train',num2str(sortorder(ix)),'.jpg'));
    j=5;
itest=imread(strcat(strcat('test',num2str(j),'.jpg')));

 
figure(j);
%subplot(6,6,ix); imshow(itrain);
 %im = imread(path);
 subplot(5,4,ix);imshow(itrain);       
 subplot(5,4,15); imshow(itest);
end
 %subplot(7,7,ix);imshow(itrain);         
% for j = 1 : 10
%     itest = '';
% itest=imread(strcat(strcat('test',num2str(j),'.jpg')));
% 
%     %path = strcat(int2str(j),'p_',int2str(4),'.tif');
% %    im=imread(itest);
%     figure(100+j): subplot(1,2,1); imshow(itest); 
%     for i = 1 : 140
% %         d = y(:,j)-x(:,i);
% %         dis1 = sqrt(d'*d);
% %         disty(i) = dis1;
%     dist(1,i)=norm(trainx(i,:)-x2);
% disty(i)=dist(1,i);
%     end
%     disty
%     dmin = min(disty)
%     k = find(disty == dmin)
%    % fstr=strcat(int2str(k(1)),'p_',int2str(1),'.tif');
% fstr = strcat(strcat('train',num2str(i),'.jpg'));
%    
%    figure(100+j): subplot(1,2,2): imshow(fstr);
%        
% end 