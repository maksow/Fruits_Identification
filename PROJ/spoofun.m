function imop = spoofun(fpath,imip)

    %%fpath='C:\SPOORTHI_LAB\PROJ\PROJ'
    fname=imip;
    fullname=strcat(fpath,imip);
    
[a1]=imread(fullname); 
a1x=im2bw(a1);
ea1=edge(a1x);
area1=bwarea(a1x);
perim1=bwarea(ea1);
f1r=mean2(a1(:,:,1));
f1g=mean2(a1(:,:,2));
f1b=mean2(a1(:,:,3));
shape1=4*(22/7)*(area1/perim1^2);
e1=10;
imop=[f1r*(1-(e1/100)),f1b*(1-(e1/100)),f1g*(1-(e1/100)),f1r*(1+(e1/100)),f1b*(1+(e1/100)),f1g*(1+(e1/100)),area1-e1,area1+e1,perim1-e1,perim1+e1,shape1*(1-(e1/100)),shape1*(1+(e1/100))];
