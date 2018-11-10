function [ output ] = Zigzag_scan( mat )
%This function takes as an input a matrix and gives as an output a vector
%of the elements in the matrix traversed in a zigzag order
% here the ii's and jj's are the variables that will be iterated on the
% matrix to produce the zigzaged vector-----------
%inputs-->mat, matrix to be zigzagly traversed
%outputs--> output, vector of length 64 containing the elements of mat in a
%zigzag order
%-----------> Apparerntly I noticed that we get upstairs if the summation
%of the indices is even and downstairs if the summation is odd which will
%be included in the cases down
%internalvariables-->ii,jj->indices of the matrix,min and max of them
%specify only dimensions
ii = 1;
jj = 1;
iimin = 1;
jjmin = 1;
iimax = 8;
jjmax = 8;
i = 1;      %index of the output vector
output = zeros(1,64);
while ((ii <= iimax) && (jj <= jjmax)) % stop condition when we are in the last elements
    if (mod(jj + ii, 2) == 1)  % to check if the sum of indices is odd so we get down
       if ((ii == iimax) && (jj <= jjmax)) % if we are in the last row so we will just increase the number of column
            output(i) = mat(ii, jj);
            jj = jj + 1;
            i = i + 1;
       elseif (jj == jjmin)                   % if we got to the first column either we go right if we are in the last one or go down if we are not
            output(i) = mat(ii, jj);
            if (ii == iimax)
                jj = jj + 1;
            else
                ii = ii + 1;
            end
            i = i + 1;
       elseif ((ii < iimax) && (jj > jjmin))     % all other cases to go down to decrease columns and increase rows
            output(i) = mat(ii, jj);
            ii = ii + 1;
            jj = jj - 1;
            i = i + 1;
       end
    else                   % now it's the time of going up                 
        if (ii == iimin)  % this is if we are in the first row so we have two options     
            output(i) = mat(ii, jj);        
            if (jj == jjmax)
                ii = ii + 1; % either go down if we are on the last column
            else
              jj = jj + 1;  % or go right if we are not
            end;
            i = i + 1;
        elseif ((jj == jjmax) && (ii < iimax))   % now if we are in the last column but not the last row so we have to go down
            output(i) = mat(ii, jj);
            ii = ii + 1;
            i = i + 1;
        elseif ((ii > iimin) && (jj < jjmax))    % this is the most general case in which we increase the column and decrease the row
            output(i) = mat(ii, jj);
            ii = ii - 1;
            jj = jj + 1;
            i = i + 1;
        end
    if ((ii == iimax) && (jj == jjmax))          % Last Element
            output(i) = mat(ii, jj);
            break;
        end
       
end
end
end
