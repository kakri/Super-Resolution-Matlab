%This file takes input from the user
%This File is for the Testing Colour images.
%Using Time Variant Regularized Backward Heat Diffusion.
%Output parameters   :Image that is seleted.
%                    :Diffusion_time.
%                    :Stopping_time.
%                    :Variance.
%                    :Time_steps.
function [image,co_eff,time_steps]=Input()
 

prompt='\n\nWanna Perform De-noising\nEnter 1 if Yes\nElse enter any number\nInput:';
number=input(prompt);

if(number==1)
  De_noising();
else
  image=imread('output.jpg');


 

 %Asks the user to enter the input for the time steps to be entered.
  prompt='\nEnter the Time Steps for the diffusion Equation(Prefarbly 0.01 t0 5)\nInput:';
  number=input(prompt);
  
  if(number>2 && number<0)
     time_steps=10000;
  else
     time_steps=number;
  end
 
  %Asks the user to enter the input for the co-effecient
  prompt='\nEnter a value for co-effiecient of Stopping time.\nExample:Diffusion_time=(co-eff)Stopping_time\n(Prefarbly 0 to 1.25)\nInput:'; 
  number=input(prompt);
 
  if(number>1.25 && number<0)
    co_eff=1;
  else
    co_eff=number;
  end
  
end
end 