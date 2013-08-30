close all;
clear all;
clc;

tic
p=480;            %no of database images
testno =120;     %no of test images
T = 0.7;


A = zeros(2500,1);

    %path = 'C:\Documents and Settings\Administrator\Desktop\D-BASE&T-CHAR\';
    path=strcat(int2str(1),'train',int2str(1),'.jpg');
    %path = strcat(int2str(1),'p_',int2str(1),'.tiff');
    im = imread(path);
    bw = im2bw(im,T);
    re = imresize(bw,[50,50]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    A = reshape(r,2500,1);
for i = 2 : p
    %path = 'C:\Documents and Settings\Administrator\Desktop\D-BASE&T-CHAR\';
    %path = strcat(int2str(i),'p_',int2str(1),'.tif');
     path=strcat(int2str(1),'p_',int2str(1),'.jpg');
    im = imread(path);
    bw = im2bw(im,T);
    re = imresize(bw,[50,50]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    A = [A,reshape(r,2500,1)];
   
end

B = zeros(2500,1)

    %path = 'C:\Documents and Settings\Administrator\Desktop\D-BASE&T-CHAR\';
    %path = strcat(int2str(1),'p_',int2str(4),'.tif');
     path=strcat(int2str(1),'p_',int2str(1),'.jpg');
    im = imread(path);
    bw = im2bw(im,T);
    re = imresize(bw,[50,50]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    B = reshape(r,2500,1);

for i = 2 : testno
    %path = 'C:\Documents and Settings\Administrator\Desktop\D-BASE&T-CHAR\';
    %path = strcat(int2str(i),'p_',int2str(4),'.tif');
     path=strcat(int2str(1),'p_',int2str(1),'.jpg');
    im = imread(path);
    bw = im2bw(im,T);
    re = imresize(bw,[50,50]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    B = [B,reshape(r,2500,1)];
   
end



x = A;
y = B;

[nx mx] = size(x);
[ny my] = size(y);

for j = 1 : my
    path = '';
    path = strcat(int2str(j),'p_',int2str(4),'.tif');
    im=imread(path);
    figure(100+j): subplot(1,2,1); imshow(path); 
    for i = 1 : mx
        d = y(:,j)-x(:,i);
        dis1 = sqrt(d'*d);
        disty(i) = dis1;
    end
    disty
    dmin = min(disty)
    k = find(disty == dmin)
    fstr=strcat(int2str(k(1)),'p_',int2str(1),'.tif');
    figure(100+j): subplot(1,2,2): imshow(fstr);
       
end 

toc