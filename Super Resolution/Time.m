%Using the Function Input_Grey_RBHD
[image,co_eff,time_steps]=Input();

blur=blurMetric(image);

 
%Displaying image
 subplot(1,2,1);
 imshow(uint8(image));
 title(sprintf('Metric:%f,Original Image',blur));


 Diffusion_time=blur;
 Stopping_time =Diffusion_time/(co_eff);
 
 %Using function Low pass Filter accoring to the Time Varient System.
 %Input Parameters:Blurred & Noisy image
 %                :Diffusion_time.
 %                :Stopping Time. 
 %                :Time_steps.
 filtered=lowpass1(image,Diffusion_time,Stopping_time,time_steps);


 %Applying the Time Variant Inverse Diffusion on the Filtered Blurred & Noisy image as input.
 %Input parameters:Filtered Blurred & Noisy image.
 %                :Stopping time.
 %                :Time_steps
 restoreImg1=imInvDiffusion(filtered,Stopping_time,time_steps);
 
 blur2=blurMetric(restoreImg1);
 
 while(1)
     if(blur2<blur)
       break;
     else  
      Diffusion_time=blur2;
      Stopping_time =Diffusion_time/(co_eff);
      restoreImg2=imInvDiffusion(filtered,Stopping_time,time_steps);
      blur2=blurMetric(restoreImg2);
     end 
 end
 
 %Displaying image
 subplot(1,2,2);
 imshow(uint8(restoreImg2));
 title(sprintf('Metric:%f,De-Blurred Image',blur2));
 
 