function [ block ] = IDCT( in )
%This function returns the inverse of the DCT coefficients calculated
%previously for each block
% Since the output of the original function was C.block.CT we will multiply
% it by C at first to obtain C.block and then multiply CT by this term to
% obtain the original block C.block.CT.C -->C.block,CT.C.block-->block
%inputs-->in,matrix containing DCT coefficients
%outputs-->block,matrix containing the original matrix
N = 8;
C = zeros(N,N);
for u = 2:N
    for v = 1:N
        C(u,v) = sqrt(2/N)*cos(((2*(v-1)+1)*pi*(u-1))/(2*N));
    end 
end 
C(1,:) = sqrt(1/N);
% So now after we generated C we will do what was mentioned in the top  
Cblock = in*C;
block = transpose(C) * Cblock;
end

