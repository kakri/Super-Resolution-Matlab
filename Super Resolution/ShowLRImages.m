% This function displays a set of low-resolution images, provided in a cell
% array.
function ShowLRImages(images)
    numCols = ceil(sqrt(numel(images)));
    numRows = numCols;
    
    for i = 1 : numRows
        for j = 1 : numCols
            imageInd = (i - 1) * numCols + j;
            subplot(numCols, numRows, imageInd);
            imshow(images{imageInd});
            hold on;
            title(sprintf('Low-Res Image No.%d', imageInd));
        end
    end
end