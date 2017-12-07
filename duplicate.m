function [ duplicate_state ] = duplicate( states, new_state )
% Function Usage
%
% [ duplicate_state ] = duplicate( states, new_state ) 
% states is a matrix contains all generated possible states in each column.
% new_state is a newly generated state that have not been stored in states
% yet.
%
% This function will return the column index of the state which the
% new_state duplicates with.
% It will return 0 if no duplicates were found.
duplicate_state = 0;

for i = 1 : size(states,2) % for every column
    if new_state == states(:,i)
        duplicate_state = i;
        break;
    end
end

end

