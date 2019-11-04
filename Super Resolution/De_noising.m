i=im2double(imread('output.jpg'));

prompt='\nEnter the Expected Noise Sigma Value';
sigma=input(prompt);

D = FAST_NLM_II(i,7,7,sigma);
imshow(D);

prompt='\nWanna Repeat\nEnter 1\nElse any other number\nInput:';
number=input(prompt);

if(number==1)
   De_noising();
else
    imwrite(D,'output.jpg');
end    