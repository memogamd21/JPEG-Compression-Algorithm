function [ condensedimg ] = Divide_Image( img )
%This Function divides the input image into blocks of 8*8 blocks
%input--img, matrix of the image
%output--> condensedimg, cell array containing the blocks of the image
[a, b] = size(img);
c = 8;
d = 8;
%l = 0;
%condensedimg = zeros((a/c),(b/d));
%for i=1:c:a-1
%    for j=1:d:b-1
    %condensedimg(i,j)=img((i:i+7),(j:j+7));
    %condensedimg(cellfun('isempty', condensedimg)) = []
    %condensedimg(i,j) = cell2mat(condensedimg(i,j))
    %eval(['out_' num2str(l) '= ' C])
    %l=l+1;
 %   end
%end

N = 8*ones(1,42);
condensedimg = mat2cell(img,N,N);
end

