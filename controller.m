function [ Mc Bc ] = controller( M, B, L, b )
% Function Usage
%
% [ Mout Bout ] = controller( M, B, L, b )
% M is the current state
% B is the incident matrix
% L and b is the constraint to build the controller

Bc = -L*B;
Mc = b - L*M;

end

