clear memory
clear all
clc
clc;
clear;
%get input pattern from file
data=open('comp.mat');
x=data.input;
t=data.t1;
 goal_err =0.05;
 epochs=10000;
% %input.Hidden and output layer definition
%input--n, hidden1--h1  hidden2-h2 ,out---m

n=4;%i/p
h1=10;%hidden1
h2=10;%hidden2
m=10;%o/p


S1=5;   % numbe of hidden layers
S2=3;   % number of output layers (= number of classes)

epochs = 10000;      % number of iterations
goal_err = 10e-5;    % goal error
a=0.3;                        % define the range of random variables
b=-0.3;
W1=a + (b-a) *rand(n,h1);     % Weights between Input and Hidden Neurons
W2=a + (b-a) *rand(h1,h2);    % Weights between Hidden and Output Neurons
W3=a + (b-a) *rand(h2,m);
b1=a + (b-a) *rand(h1,1); 
b2=a + (b-a) *rand(h2,1);
b3=a + (b-a) *rand(m,1);

% Weights between Hidden and Output Neurons
n1=x*W1;
A1=logsig(n1);
n2=W2'*A1;
A2=logsig(n2);
n3=W3'*A2;
A3=logsig(n3);

e=A2-t;
error =0.5* mean(mean(e.*e));    
nntwarn off
for  itr =1:epochs
    if error <= goal_err 
        break
    else
         for i=1:10
            df1=dlogsig(n1,A1(:,i));
            df2=dlogsig(n2,A2(:,i));
            s2 = -2*diag(df2) * e(:,i);			       
            s1 = diag(df1)* W2'* s2;
            W2 = W2-0.1*s2*A1(:,i)';
            b2 = b2-0.1*s2;
            W1 = W1-0.1*s1'*x(:,i);
            b1 = b1-0.1*s1;

            A1(:,i)=logsig(W1*x(:,i));
            A2(:,i)=logsig(W2*A1(:,i));
         end
   
            e = T - A2;
            error =0.5*mean(mean(e.*e));
            disp(sprintf('Iteration :%5d        mse :%12.6f%',itr,error));
            mse(itr)=error;
    end
end
% 
% threshold=0.9;   % threshold of the system (higher threshold = more accuracy)
% 
% % training images result
% 
% %TrnOutput=real(A2)
% TrnOutput=real(A2>threshold)    
% 
% % applying test images to NN
% n1=W1*N;
% A1=logsig(n1);
% n2=W2*A1;
% A2test=logsig(n2);
% 
% % testing images result
% 
% %TstOutput=real(A2test)
% TstOutput=real(A2test>threshold)
% 
% 
% % recognition rate
% wrong=size(find(TstOutput-T),1);
% recognition_rate=100*(size(N,2)-wrong)/size(N,2)