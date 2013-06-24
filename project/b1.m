load aaa
k=0;
str2='.jpg';
for i=1:10
    for j=1:10
filename1 =imread( strcat(strcat(num2str(i)),str2)); 
if y(i,j)==1
   vx=strcat(strcat('test',num2str(i),str2)); 
   imwrite(filename1,vx);
   k=k+1;
else
    k=k-1;
end

    end 
end 
