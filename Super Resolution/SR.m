function []=SR(im) 

 im = imresize(im,[1400,1400]);
 im = im2double(im);
 %% Simulate the low-resolution images
 numImages = 4;
 blurSigma = 1;
 [ images, offsets ,croppedOriginal ] = SynthDataset(im, numImages, blurSigma);
 %% Compute the Super-Resolution image
 [ lhs, rhs  ] = SREquations(images, offsets, blurSigma);

 K = sparse(1 : size(lhs, 2), 1 : size(lhs, 2), sum(lhs, 1));
 initialGuess = K \ lhs' * rhs; % This is an 'average' image produced from the LR images.
 
HR = GradientDescent(lhs, rhs, initialGuess);
HR = reshape(HR, sqrt(numel(HR)), sqrt(numel(HR)));
 %% Visualize the results
%   ShowLRImages(images);
 figure;
 subplot(2, 2, 3);
 imshow(HR);
 title('Registration');
 subplot(2, 2, 2);
 intermediate=imresize(imresize(croppedOriginal, 0.5), 2);
 imshow(intermediate);
%  imshow(imresize(imresize(croppedOriginal, 0.5), 2));
 title('Bicubic Interpolation');
 subplot(2, 2, 1);
 imshow(croppedOriginal);
 title('Reference');
 %% Compute the mean-square error of reconstruction.
 mse = sum((HR(:) - croppedOriginal(:)) .* (HR(:) - croppedOriginal(:))) / numel(HR);
 fprintf(1, 'Reconstruction Mean-square error: %f\n', mse);

 output=en1(HR);
 subplot(2, 2, 4);
 imshow(output);
 title('Super Resolution');

 imwrite(output,'output.jpg');

 Deblurring();