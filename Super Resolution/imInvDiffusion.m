%IMAGE DEBLUR WITH REGULARIZED BACKWARD HEAT DIFFUSION-Liang Wang,Luo,Wang.
%This Function performs the Time Variant Inverse Diffusion process on gray scale images.
%Input Parameters:Input image(Blurred or Filtered Image).
%                :Time Step.
%                :Stopping Time.
%                :Cut-off Frequency.
function v_new=imInvDiffusion(image,T,time_steps)
 
 %Time-Steps
 dt=time_steps;

 
 %Converting the input image matrix to double precision
 v_t=double(image);
 
 %Obtaining the size of image
 [p,q]=size(v_t);
 
 %Storing the double precision value of image to v_new
 v_new=double(v_t);

 %Terms in inverse partial differential equation.
 v_xx=v_t(:,[2:q,q]) -2*v_t(:,:) + v_t(:,[1,1:q-1]);
 v_yy=v_t([2:p,p],:)-2*v_t(:,:) + v_t([1,1:p-1],:);
 v_xy = (v_t([2:p,p],[2:q,q]) +v_t([1,1:p-1],[1,1:q-1]) -v_t([1,1:p-1],[2:q,q]) - v_t([2:p,p],[1,1:q-1]) ) / 4;
 v_x = (v_t(:,[2:q,q]) - v_t(:,[1,1:q-1]))/2;
 v_y = (v_t([2:p,p],:) - v_t([1,1:p-1],:))/2;
 mod_grad=(v_x.^2 + v_y.^2);
 
 
 Theta=0.3;
 
 %Normal Component
 v_NN=(v_xx.*v_y.^2 + 2.*v_x.*v_y.*v_xy + v_yy.*v_x.^2)./mod_grad;
 
 %Stopping Criterion
 Stop_Criterion=(v_xx.*v_x.^2 - 2.*v_xy.*v_x.*v_y + v_yy.*v_y.^2)./(mod_grad).^(1.5);
 
 for t=0:dt:T
%     for r=1:1:3
           if(Stop_Criterion>Theta)
             break;  
           else
            v_new(:,:) = v_t(:,:)-dt.*(0.2.*(v_xx+v_yy)-0.02.*v_NN);
            v_t = v_new;
           end 
%    end
 end

end