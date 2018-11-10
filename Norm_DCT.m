function [ DCTs_New ] = Norm_DCT( DCTs,state )
%This function normalizes the DCT coefficients using the below made
%quantization tables 
%inputs-->DCTs,coefficients of the DCT transform - state, number to
%determine which Q table to be used 
% out-->DCTs_New, matrix contaaining normalized values of DCTs
[ r,c] = size(DCTs);
Q1 = [1,1,1,1,1,2,2,4;
    1,1,1,1,1,2,2,4;
    1,1,1,1,2,2,2,4;
    1,1,1,1,2,2,4,8;
    1,1,2,2,2,2,4,8;
    2,2,2,2,2,4,8,8;
    2,2,2,4,4,8,8,16;
    4,4,4,4,8,8,16,16]; 

Q2 = [1,2,4,8,16,32,64,128;
    2,4,4,8,16,32,64,128;
    4,4,8,16,32,64,128,128;
    8,8,16,32,64,128,128,256;
    16,16,32,64,128,128,256,256;
    32,32,64,128,128,256,256,256;
    64,64,128,128,256,256,256,256;
    128,128,128,256,256,256,256,256];
    
switch state
    case 1 
        %for i = 1:r
        %    for j = 1:c
         %       DCTs_New(i,j) = round(DCTs(i,j)/Q1(i,j));
          %  end
        %end
        DCTs_New = round(DCTs ./ Q1);
    case 2
         %for i = 1:r
          %  for j = 1:c
           %     DCTs_New(i,j) = round(DCTs(i,j)/Q2(i,j));
           % end
         %end
         DCTs_New = round(DCTs ./ Q2);
end
end

