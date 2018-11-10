function [ t ] = Runlengthdecode( M )
%This function takes as input a vector of encoded bits and unpack it to the
%originl
%input-->M,encoded vector of bits
%output->t, unpacked verion of it
%j-->counter for number of zeros 
i = 1;
t = []; 
if M(1) == 0
    for k = 1:M(2)
        t(length(t)+1) = 0;
    end
end 
if M(1) ~= 0
    t(length(t)+1) = M(1);
end
i = 2;
while i <= length(M)-1
    if M(i) ~= 0 && M(i-1)~= 0
        t(length(t)+1) = M(i);
        i = i+1;
    end
    if M(i) ~= 0 && M(i-1) == 0
       i = i + 1; 
    end
    if M(i) == 0 && i <= length(M)-1
        for j = 1:M(i+1)
            t(length(t)+1) = 0;
        end
        i = i+1;
    end
end
if M(length(M)) ~= 0 && M(length(M) - 1) ~= 0
    t(length(t)+1) = M(length(M));
end
end

