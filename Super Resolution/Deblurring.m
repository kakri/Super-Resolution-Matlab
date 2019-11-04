function []=Deblurring()

prompt='\nEnter \n1.If you want to De-blur\n2.Else Display Output Image\nInput:';
number=input(prompt);

if(number==1)
 Time();
else
  figure  
  imshow('output.jpg');
end  