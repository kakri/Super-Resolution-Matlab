% This file is an example script for executing the Super-Resolution
% algorithm.
clc
clear variables
close all
dbstop if error
%% Prepare the reference image
%Tests on two input grey scale images.
image1=imread('cameraman.tif');
image2=imread('orig.jpg');
 
%Asks the user to enter the input for image to be selected. 
 prompt1='Enter number(1 or 2) for input images \n1.Cameraman_Image\n2.LR_Image\nInput:';
 number=input(prompt1);
 
 if(number == 1)
   im=image1;
%    im = rgb2gray(im);
 else
   im=image2;
 end
 

% im = rgb2gray(im);
prompt='\n\nDo you wanna crop the image\nEnter 1 if Yes\nElse enter any number\nInput:';
number=input(prompt);

if(number==1)
 im = crop(im);
 SR(im);
else 
 SR(im);
end 