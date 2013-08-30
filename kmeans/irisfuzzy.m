load fisheriris
       data = meas(:,1:4);
       testdata=data(1:50,:);
       traindata=data(51:150,:);
       csvwrite('testx.dat',testdata);
       csvwrite('trainx.dat',traindata);