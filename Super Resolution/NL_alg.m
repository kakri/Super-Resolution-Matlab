function NL=NL_alg(I)
% I=imread('4.jpg');
I=double(I);
h=0.05;
for i = 1:size(I,1)
    tic
    sprintf('%d/%d',i,size(I,1))
    for j = 1:size(I,2)
        Z = 0;
        for k = 1:size(I,1)
            for l = 1:size(I,2)
                w = exp((-abs(I(i,j)-I(k,l)).^2)/(h^2));

                Z = Z + w;
            end
        end

        sumV = 0;
        for k = 1:size(I,1)
            for l = 1:size(I,2)
                w = exp((-abs(I(i,j)-I(k,l))^2)/(h^2));
                w = w/Z;

                sumV = sumV + w * I(k,l);
            end
        end

        NL(i,j) = sumV;
    end
    toc
end