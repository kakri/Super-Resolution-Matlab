%This function is for Low pass filtering process in the Time InVariant RBHD Process.
%Input parameters:Reconstructed image using inverse heat diffusion process.
%                :Diffusion time.
%                :Stopping_time.
%                :Time_steps.
function [filteredim,c_freq] = lowpass2(I,Diffusion_time,Stopping_time,time_steps)
 
 %Converting the matrix of the image to unsigned 8-bit integer type.
 image=uint8(I);
 
 %Determining the size of the image
 [co,ro] = size(image);
 
 %Determining the center of the image
 cx = round(co/2); 
 cy = round (ro/2);
 
 %On applying the Discrete Fourier transform
 %Shifting zero-frequency component to center of spectrum
 imf=fftshift(fft2(image));
 H=zeros(co,ro);
 for i = 1 : co
    for j =1 : ro
      
        %Frequency domain term.
        d = sqrt((i-cx).^2 + (j-cy).^ 2);
       
        %Calculating the Cut-off Frequency Function.
        [c_freq]=Calculate_cut_freq(d,Diffusion_time,Stopping_time,time_steps);
     
        %According to Equation-18 in paper.         
         H(i,j)=exp(-(norm(d)./ c_freq)^4);
            
        
    end;
 end;
 
 %Obtaining the Filtered Image.
 outf = imf .* H;
 filteredim = abs(ifft2(outf));

end
