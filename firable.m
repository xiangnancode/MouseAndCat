function [ TF ] = firable( M, B, t )

% Function Usage
%
% [ TF ] = firable( M, B, t )
% M is the current state
% B is the incident matrix
% t is the transition wander to check
% This function will return 1 is the input transition is firable, return 0
% if it is not firable.

Mnext = M + B(:,t);% find the next state
number_of_negative_entries=length( find( Mnext < 0 ) );% find the number of negative entries
if number_of_negative_entries == 0
    TF = 1;% if all entries are positive, this state is firable, return 1
else
    TF = 0;% otherwise return 0
end

end
