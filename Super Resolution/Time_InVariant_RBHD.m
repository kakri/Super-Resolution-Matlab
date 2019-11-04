
%IMAGE DEBLUR WITH REGULARIZED BACKWARD HEAT DIFFUSION-Liang Wang,Luo,Wang.
%This m-file is an implementation of Time InVariant RBHD.
%This method works for grey scale images.

% Remove items from workspace, freeing up system memory
clear all;
format short;




 %Using the Function Input_Grey_RBHD
 [image,co_eff,time_steps]=Input();

 %Uses thefunction gaussFilter for addiing noise and blurring components on
 %input gray scaleimage.
 %Input parameters:Input image
 %                :Diffusion_time.
 %                :Variance.
 %image=gaussFilter(input,Diffusion_time,Variance);


 blur=blurMetric(image);

 %Displaying image
 subplot(2,3,1);
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

%Displaying image
subplot(2,3,2);
imshow(uint8(restoreImg1));
title(sprintf('Metric:%f,Restoration with filtering',blur2));


Diffusion_time=(blur2);
Stopping_time=Diffusion_time/(co_eff);

restoreImg2=imInvDiffusion(restoreImg1,Stopping_time,time_steps);
blur4=blurMetric(restoreImg2);
subplot(2,3,3);
imshow(uint8(restoreImg2));
title(sprintf('Metric:%f,Final Image',blur4));
 

% time_steps=time_steps*6;
Diffusion_time=(blur4);
Stopping_time=Diffusion_time/(co_eff);

restoreImg3=imInvDiffusion(restoreImg2,Stopping_time,time_steps);
blur5=blurMetric(restoreImg3);
subplot(2,3,4);
imshow(uint8(restoreImg3));
title(sprintf('Metric:%f,Final Image 1',blur5));


Diffusion_time=(blur5);
Stopping_time=Diffusion_time/(co_eff);

restoreImg4=imInvDiffusion(restoreImg3,Stopping_time,time_steps);
blur6=blurMetric(restoreImg4);
subplot(2,3,5);
imshow(uint8(restoreImg4));
title(sprintf('Metric:%f,Final Image 2',blur6));


Diffusion_time=(blur6);
Stopping_time=Diffusion_time/(co_eff);

restoreImg5=imInvDiffusion(restoreImg4,Stopping_time,time_steps);
blur7=blurMetric(restoreImg5);
subplot(2,3,6);
imshow(uint8(restoreImg5));
title(sprintf('Metric:%f,Final Image 3',blur7));

fprintf('\n1.Original Image\n2.Restoration with Filtering\n3.Final Image\n4.Final Image 1\n5.Final Image 2\n6.Final Image 3\n7.Repeat Again');


prompt='\nEnter the number of desired Image:';
number=input(prompt);

switch(number)
    case 1
        imwrite(uint8(image),'output.jpg');
        figure  
        imshow('output.jpg');
    case 2
        imwrite(uint8(restoreImg1),'output.jpg');
        figure  
        imshow('output.jpg');
    case 3    
        imwrite(uint8(restoreImg2),'output.jpg');
        figure  
        imshow('output.jpg');
        
    case 4   
        imwrite(uint8(restoreImg3),'output.jpg');
        figure  
        imshow('output.jpg');
    case 5   
        imwrite(uint8(restoreImg4),'output.jpg');
        figure  
        imshow('output.jpg');
    case 6   
        imwrite(uint8(restoreImg5),'output.jpg');
        figure  
        imshow('output.jpg');
    otherwise
        Deblurring();
end

