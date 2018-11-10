function [ coeffs ] = DCT( block )
% In this function we generate at first the DCT transform matrix as a
% function of u,v only then multiply it by the block and then multiply the
% result by the DCT matrix transpose to get the DCT of the block
% input--> block of size 8*8 to be DCTed
%output --> coeffs, matrix containing the DCT coefficients of the block
% I used this video for further info about how I implemented it --> https://www.youtube.com/watch?v=RYqQT4W85t4
% it basically multiplies C by block then by transpose(C)
N = 8;
C = zeros(N,N);
for u = 2:N
    for v = 1:N
        C(u,v) = sqrt(2/N)*cos(((2*(v-1)+1)*pi*(u-1))/(2*N));
    end 
end 
C(1,:) = sqrt(1/N);
coeffs1 = [C*block];
coeffs1 = mtimes(C,block);
coeffs = [coeffs1 * transpose(C)];
coeffs = mtimes(coeffs1,transpose(C));
end

