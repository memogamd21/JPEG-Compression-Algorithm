function [ mat ] = Inversezigzag( vec,iimax ,jjmax)
%This function takes as an input a vector and the desired dimensions (8*8) to
%unpack this vector to its origin after it has been zigzagly scanned 
% inputs-->vec was originated from a zigzag scan - iimax,jjmax matrix
% dimension to be unpacked to , in our case it's 8,8 
% Output --> mat a matrix of 8*8 dimension with the values inversely
% zigzaged
jj = 1;
ii = 1;
iimin = 1;
jjmin = 1;
mat = zeros(iimax, jjmax);
i = 1;
while ((ii <= iimax) && (jj <= jjmax))
    if (mod(ii + jj, 2) == 1)    % if the sum of the indices is odd we go down , if it's even we go up         
       if ((ii == iimax) && (jj <= jjmax))%in this case we have the last row but not the last column
            jj = jj + 1; % we just increase the column
            i = i + 1;
       elseif (jj == jjmin) % here if we have the columns at the minimum
            mat(ii,jj) = vec(i);
            if (ii == iimax)
                jj = jj + 1; % if it's last row so we advance coulmns else we advance rows
            else
                ii = ii + 1;
            end
            i = i + 1;
       elseif ((ii < iimax) && (jj > jjmin)) % general case we advance rows and decrease columns
            mat(ii,jj) = vec(i);
            ii = ii + 1;
            jj = jj - 1;
            i = i + 1;
       end
    else                 % This case to go up
        if (ii == iimin)  % if first row
            mat(ii, jj) = vec(i);
            if (jj == jjmax)% if last column we get down if not we get right
                ii = ii + 1;
            else
                jj = jj + 1;
            end
            i = i + 1;
        elseif ((jj == jjmax) && (ii < iimax)) % if we have maxcolumn and not maxrow
            mat(ii, jj) = vec(i); % we just increase the rows
            ii = ii + 1;
            i = i+1;
        elseif ((ii > iimin) && (jj < jjmax))% general case we decrease rows and advance columns
            mat(ii,jj) = vec(i);
            ii = ii - 1;
            jj = jj + 1;
            i = i + 1;
        end       
    if ((ii == iimax) && (jj == jjmax))
        mat(ii,jj) = vec(i);
        break;
    end
    end
end
end
