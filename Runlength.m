function [ M ] = Runlength( X )
%This function returns the run length encoded stream of the vector M
%input--> X,containing lots of zeros so we'll encode its zeros as 0 9 for
%example
%out--> M, vector of much shorter length compressing the values of input
% it finds the zero elements and counts them till the next nonzero element
% and then append this new number beside the zero in the new vector
%j-->counter for number of zeros
X(length(X)+1) = 1; % here we padded a 1 by the end as there is a part in the loop that needs to be terminated by padding a non zero element by the end , I will mark it
i = 1;
j = 1;
M = [];

while i<=length(X)-1
    if X(i) ~= 0
        M(length(M) + 1) = X(i);
    end
    if X(i) == 0 && i < length(X)
        if X(i+1) ~= 0 
            M(length(M) + 1) = 0;
            M(length(M) + 1) = 1;
        end
        if X(i+1) == 0 && i <= length(X)-1 
            while X(i+1) == 0 && i <= length(X)-1 % This is the part mentioned in the first comment
                j = j+1;
                i = i+1;
            end
            if j > 1 || i == length(X)-1
                M(length(M) + 1) = 0;
                M(length(M) + 1) = j;
            end
            if j > 9 
                M(length(M)) = [];
                M(length(M)) = [];
                for p = 1: j/9
                   M(length(M) + 1) = 0;
                   M(length(M) + 1) = 9;
                end
                if mod(j,9) ~= 0
                   M(length(M) + 1) = 0;
                   M(length(M) + 1) = mod(j,9);
                end
            end
            if j <= 9 
                M(length(M)) = [];
                M(length(M)) = [];      
                M(length(M) + 1) = 0;
                M(length(M) + 1) = j;
            end 
        end
        j = 1;
    end
        i = i+1;
end
end

