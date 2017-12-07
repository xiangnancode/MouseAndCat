function [ T ] = firable_transitions( M, B )
% Function Usage
%
% [ T ] = firable_transitions( M, B )
% M is the current state
% B is the incident matrix
% This function will return all transitions that are enabled under state M.
% It will return -1 if no transitions are enabled.
i=1;
T(i) = -1;
for j = 1 : size(B,2)% for every column, which means for every transitions
    if firable(M,B,j)% if this transition is firable
        T(i) = j;% store the index of the firable transition
        i = i+1;% index increment
    end
end

end

