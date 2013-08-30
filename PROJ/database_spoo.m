%%%load database
cd('C:\SPOORTHI_LAB\PROJ\PROJ');
c1='C:\SPOORTHI_LAB\PROJ\PROJ\';
f1=spoofun(c1,'apple.jpg');
f2=spoofun(c1,'banana.jpg');
f3=spoofun(c1,'capscium.jpg');
f4=spoofun(c1,'greenapp.jpg');
f5=spoofun(c1,'lemon.jpg');
f6=spoofun(c1,'orange.jpg');
f7=spoofun(c1,'pineapple.jpg');
f8=spoofun(c1,'redcapscium.jpg');
f9=spoofun(c1,'strawberry.jpg');
f10=spoofun(c1,'watermelon.jpg');
f11=spoofun(c1,'mango.jpg');
f12=spoofun(c1,'tomato.jpg');
f13=spoofun(c1,'blueberry.jpg');
f14=spoofun(c1,'muskmelon.jpg');
f15=spoofun(c1,'brinjal.jpg');
f16=spoofun(c1,'apple1.jpg');
f17=spoofun(c1,'apple2.jpg');
f18=spoofun(c1,'apple3.jpg');

%%f12=spoofun('apple.jpg');
f=[f1;f2;f3;f4;f5;f6;f7;f8;f9;f10;f11;f12;f13;f14;f15;f16;f17;f18];
%g=['APPLE';'BANANA';'CAPSCIUM';'GREEN APPLE';'LEMON';'ORANGE';'PINE APPLE';'RED CAPSCIUM';'STRAWBERRY';'WATERMELON';'MANGO'];
%%g=cellstr(g);
g=1:size(f);
xlswrite('DATABASE.xls',f,'DATABASE','B2:M19');
xlswrite('DATABASE.xls',g','DATABASE','O2:O19');
g1={'APPLE','BANANA','CAPSCIUM','GREEN APPLE','LEMON','ORANGE','PINEAPPLE','REDCAPSCIUM','STRAWBERRY','WATERMELON','MANGO','TOMATO','BLUEBERRY','MUSKMELON','BRINJAL','APPLE1','APPLE2','APPLE3'};
g2=cellstr(g1);
%display(g2)

display('done with databaseload');