function v_new=diffusion(Xdown,beta,K,lambda,T,time_steps)

%Time-Steps
dt=time_steps;
 


%Converting the input image matrix to double precision
v_t=double(Xdown);
 
%Obtaining the size of image
[p,q]=size(v_t);
 
%Storing the double precision value of image to v_new
 v_new=double(v_t);
 initial=double(Xdown);
 
 
 
 
 %Terms in inverse partial differential equation.
 v_xx=v_t(:,[2:q,q]) -2.*v_t(:,:) + v_t(:,[1,1:q-1]);
 
 v_yy=v_t([2:p,p],:)-2.*v_t(:,:) + v_t([1,1:p-1],:);
 
 v_xy = (v_t([2:p,p],[2:q,q]) +v_t([1,1:p-1],[1,1:q-1]) -v_t([1,1:p-1],[2:q,q]) - v_t([2:p,p],[1,1:q-1]) ) / 4;
 
 v_x = (v_t(:,[2:q,q]) - v_t(:,[1,1:q-1]))/2;
 
 v_y = (v_t([2:p,p],:) - v_t([1,1:p-1],:))/2;
 mod_grad=(v_x.^2 + v_y.^2);
 
 gamma=calc_gamma(v_new,0.2);
 
 
 %Tangential and Normal Components.
 v_TT=(v_xx.*v_y.^2 - 2.*v_x.*v_y.*v_xy + v_yy.*v_x.^2)./mod_grad;
 v_NN=(v_xx.*v_y.^2 + 2.*v_x.*v_y.*v_xy + v_yy.*v_x.^2)./mod_grad;
 
 %Tangential and Normal co_eff.
 v_TT_Coeff=beta*K*(1./(1+(sqrt(mod_grad)./lambda).^gamma)).*v_TT;
 v_NN_Coeff=beta*K*((1+(1-gamma).*(sqrt(mod_grad)./lambda).^gamma))./(((1+(sqrt(mod_grad)./lambda).^gamma)).^2).*v_NN;
 
 
 for t=0:dt:T
     
           
           
          
            
 
 
 
            v_new(:,:) = v_t(:,:)+dt.*(v_TT_Coeff+v_NN_Coeff+((beta/100).*K.*(initial-v_t(:,:))));
     
   v_t = v_new;
 end

end
