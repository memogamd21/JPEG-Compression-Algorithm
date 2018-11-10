function [ t ] = Unnormalize( in,state )
%This function normalizes the input matrix by multiplying it by the
%This function unnormalizes the normalized DCT coefficients using the below made
%quantization tables 
%inputs-->in,coefficients of the DCT transform - state, number to
%determine which Q table to be used 
% out-->t, matrix contaaining normalized values of DCTs
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
        t = in.*Q1;
    case 2
        t = in.*Q2;
end
end

