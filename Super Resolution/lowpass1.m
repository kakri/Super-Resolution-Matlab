%This function is for Low pass filtering process in the Time Variant RBHD Process.
%Input parameters:Blurred and Noisy Image.
%                :Diffusion time.
%                :Stopping_time.
%                :Time_steps.
function filteredim = lowpass1(I,Diffusion_time,Stopping_time,time_steps)
 
 %Converting the matrix of the image to unsigned 8-bit integer type.
 imag=uint8(I);
 
 %Determining the size of the image
 [co,ro,~] = size(imag);
 
 %Determining the center of the image
 cx = round(co/2); 
 cy = round (ro/2);
 
 for i = 1 : co
    for j =1 : ro
        %Frequency domain term.
        d = sqrt((i-cx).^2 + (j-cy).^ 2);
        
    end
 end
 
 %Calculating the Cut-off Frequency Function.
 [c_freq]=Calculate_cut_freq(d,Diffusion_time,Stopping_time,time_steps);
     
 
 
 
 %On applying the Discrete Fourier transform
 %Shifting zero-frequency component to center of spectrum
 imf=fftshift(fft2(imag));
 H=zeros(co,ro);
 for i = 1 : co
    for j =1 : ro
%        for r=1:1:3
        %Frequency domain term.
        d = sqrt((i-cx).^2 + (j-cy).^ 2);
       
%         %Calculating the Cut-off Frequency Function.
%         [c_freq]=Calculate_cut_freq(d,Diffusion_time,Stopping_time,time_steps);
 
        %According to equation-16 in paper
        H(i,j)=exp(-(norm(d)./ c_freq)^4);
        %H(i,j)=single(d<=c_freq);
            
%       end;
    end;
 end;
 
 %Obtaining the Filtered Image.
 outf = imf .* H;
 filteredim = abs(ifft2(outf));

end
