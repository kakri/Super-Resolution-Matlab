function gamma=calc_gamma(im,sigma)
  im=Gaus_filter(im,sigma);
  d=norm(im);
  d=exp(-d);
  gamma=2*(1-0.2*d);
  
end  