function [ uniq,probabilities ] = probabilities( vec )
% This function computes the probabilities of the symbols inside a vector
% input--> vec,vector containing the values to compute the probabilities of
%output--> uniq, vector containing the unique symbols-
%probabilities-->containing the probabilities of the symbols
uniq = unique(vec);% we find at first the unique symbols and then calculate the number of their occurrences and then their probabilities
uniq = transpose(uniq);
probabilities = zeros(1,length(uniq));
for i = 1:length(uniq)
    probabilities(i) = (sum(vec == uniq(i))/length(vec));% here we summed all the elements from chardata that equals the current element of uniq
end
end

