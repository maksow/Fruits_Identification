% input dataset of 10 features
%R-mean,G-mean,B-mean,totalmean,area,perimeter,ratiotest,compactnesstest,centroid
x=[0.3533 0.2426 0.2431 0.2797 27134 763.0021 0.7076 446.8872 113.8430 120.8910;
   0.2837 0.3654 0.1924 0.2805 25145 624.3158 0.9390 506.1243 116.5123 115.7731; 
   0.4584 0.3888 0.1931 0.3468 26430 847.6123 0.4592 391.8409 146.8726 123.8073;
   0.5760 0.4186 0.1770 0.3905 30754 681.5706 0.6399 567.0229 127.1033 107.5058; 
   0.4160 0.3068 0.2502 0.3243 26994 634.8600 0.9768 534.3172 118.8293 110.0220;
   0.3113 0.3333 0.2200 0.2882 20455 557.6051 0.9538 460.9805 115.8213 112.7947;  
   0.3121 0.2740 0.2024 0.2629 19061 588.8356 0.5934 406.7818 129.2883 94.2508;
   0.4841 0.4896 0.2343 0.4026 31589 742.5412 0.6992 534.5954 93.7842 152.1002; 
   0.6527 0.2395 0.2402 0.3775 39846 853.1859 0.7935 586.8822 98.6820 129.3011; 
   0.2471 0.2970 0.2056 0.2499 30306 683.3036 0.8312 557.3458 122.9728 107.3966];%RGB means&shape features of 10 fruits
  
   t1=[1 0 0 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0 0 0;
        0 0 0 1 0 0 0 0 0 0;
        0 0 0 0 1 0 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 0 0 0 1 0 0;
        0 0 0 0 0 0 0 0 1 0;
        0 0 0 0 0 0 0 0 0 1];
    save fcomp.mat
                   