%This Function is for Calculating Cut-off Frequency.
function [c_freq]=Calculate_cut_freq(d,Diffusion_time,Stopping_time,time_steps)

 %Calculating omegaaccording to equation 14 in paper 
 omega=d^2;

 %Calculating Backward_time
 time=Stopping_time*time_steps;
 
 %Calcuting cut_off Frequency term 
 %Combining the equations 14 & 27 in the paper.
 c_freq=sqrt(omega*time/Diffusion_time);
 c_freq=c_freq+2;
end 