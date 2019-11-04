function output=en1(I)
K=1;
% beta=0.00000001;
beta=0.0001;
%lamba=100;
lambda=1;
% gamma=1.5;
T=100;
time_steps=0.1;
output=diffusion(I,beta,K,lambda,T,time_steps);
a=(isnan(output));
output(a)=0;
% imshow(uint8(output));
