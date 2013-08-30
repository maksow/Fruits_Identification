clear all
close all
clc
 [num,txt,raw]= xlsread('F:\project\fruits\workingcodesnew\fishiris.xlsx');
 %X=xlsread('F:\project\fruits\workingcodesnew\fishiris.xlsx');
%load iris.dat
%load fisheriris
meas=num(1:150,1:4);
species=txt(1:150,1);
% ds = mat2dataset(meas);
gscatter(meas(:,2), meas(:,3), species,'brg','dos');
xlabel('Sepal length');
ylabel('Sepal width');
N = size(meas,1);

ldaClass = classify(meas(:,1:2),meas(:,1:2),species);
bad = ~strcmp(ldaClass,species);
ldaResubErr = sum(bad) / N;
[ldaResubCM,grpOrder] = confusionmat(species,ldaClass);
hold on;
plot(meas(bad,1), meas(bad,2), 'kx');
hold off;
[x,y] = meshgrid(4:.1:8,2:.1:4.5);
x = x(:);
y = y(:);
j = classify([x y],meas(:,1:2),species);
figure,gscatter(x,y,j,'grb','sod')
hold on


qdaClass = classify(meas(:,1:2),meas(:,1:2),species,'quadratic');
bad = ~strcmp(qdaClass,species);
qdaResubErr = sum(bad) / N;
rng(0,'twister');
cp = cvpartition(species,'k',10);
            
ldaClassFun= @(xtrain,ytrain,xtest)(classify(xtest,xtrain,ytrain));
ldaCVErr  = crossval('mcr',meas(:,1:2),species,'predfun', ...
             ldaClassFun,'partition',cp);
qdaClassFun = @(xtrain,ytrain,xtest)(classify(xtest,xtrain,ytrain,...
              'quadratic'));
qdaCVErr = crossval('mcr',meas(:,1:2),species,'predfun',...
           qdaClassFun,'partition',cp);
nbGau= NaiveBayes.fit(meas(:,1:2), species);
nbGauClass= nbGau.predict(meas(:,1:2));
bad = ~strcmp(nbGauClass,species);
nbGauResubErr = sum(bad) / N;
nbGauClassFun = @(xtrain,ytrain,xtest)...
               (predict(NaiveBayes.fit(xtrain,ytrain), xtest));
nbGauCVErr  = crossval('mcr',meas(:,1:2),species,...
              'predfun', nbGauClassFun,'partition',cp);
nbKD= NaiveBayes.fit(meas(:,1:2), species,'dist','kernel');
nbKDClass= nbKD.predict(meas(:,1:2));
bad = ~strcmp(nbKDClass,species);
nbKDResubErr = sum(bad) / N;
nbKDClassFun = @(xtrain,ytrain,xtest)...
            (predict(NaiveBayes.fit(xtrain,ytrain,'dist','kernel'),xtest));
nbKDCVErr = crossval('mcr',meas(:,1:2),species,...
            'predfun', nbKDClassFun,'partition',cp);
t = classregtree(meas(:,1:2), species,'names',{'SL' 'SW' });
[grpname,node] = t.eval([x y]);
gscatter(x,y,grpname,'grb','sod');
view(t);
dtclass = t.eval(meas(:,1:2));
bad = ~strcmp(dtclass,species);
dtResubErr = sum(bad) / N;

dtClassFun = @(xtrain,ytrain,xtest)(eval(classregtree(xtrain,ytrain),xtest));
dtCVErr  = crossval('mcr',meas(:,1:2),species, ...
          'predfun', dtClassFun,'partition',cp);
resubcost = test(t,'resub');
[cost,secost,ntermnodes,bestlevel] = test(t,'cross',meas(:,1:2),species);
plot(ntermnodes,cost,'b-', ntermnodes,resubcost,'r--');
figure(gcf);
xlabel('Number of terminal nodes');
ylabel('Cost (misclassification error)');
legend('Cross-validation','Resubstitution');
[mincost,minloc] = min(cost);
cutoff = mincost + secost(minloc);
hold on
plot([0 20], [cutoff cutoff], 'k:')
plot(ntermnodes(bestlevel+1), cost(bestlevel+1), 'mo');
legend('Cross-validation','Resubstitution','Min + 1 std. err.','Best choice');
hold off
pt = prune(t,bestlevel);
view(pt);
cost(bestlevel+1);

testvirginica=meas(115,1:2);
SL=testvirginica(1,1);
SW=testvirginica(1,2);
if SL<5.45 
   if SW<2.8       
class = 'versicolor'
else
class='setosa'
end
end
if SL>=5.45 
   if SL<6.55 && SW<3.45
       class = 'versicolor'
   else
       class='setosa'
   end
   if SL>=6.15
       class='virginica';
   end
end
% trainsetosa=meas(1:25,:);
% testsetosa=meas(26:50,:);
% trainversicolor=meas(51:75,:);
% testversicolor=meas(76:100,:);
% trainvirginica=meas(101:125,:);
% testvirginica=meas(126:150,:);




if SL<5.45 
   if SW<2.8       
class = 'versicolor'
else
class='setosa'
end
end

if SL>=5.45 
   if SL<6.15 && SW<3.45 && SL<5.75
       class = 'versicolor'
   else if SL>=5.75 && SW<3.1&&SW<2.95
       class='versicolor'
   end
   if SL>=6.15
       class='virginica';
   end
end


