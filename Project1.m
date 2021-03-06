clear all
clc


B = [ -1  1  0  0      0  0  0  0     1  0  0  0;
       1 -1  0  0      0  0  0  0     0  0  0 -1;
       0  0  0  0      0  0 -1  1    -1  0  0  0;
       0  0  0  0      0  0  1 -1     0  0  0  1;
       
       0  0  1 -1      0  0  0  0     0 -1  0  0;
       0  0 -1  1      0  0  0  0     0  0  1  0;
       0  0  0  0      1 -1  0  0     0  1  0  0;
       0  0  0  0     -1  1  0  0     0  0 -1  0];

Mo = [0 0 0 1 1 0 0 0]';

L = [ eye(4) eye(4)];
b = [1 1 1 1]';

[ Mc Bc ] = controller( Mo, B, L, b );
Bc
Mc

M_new = [Mo;Mc];
B_new = [B;Bc];
[ states connection ] = reachablestates( M_new, B_new );
states
connection

% 
% Bc =
% 
%      1    -1    -1     1     0     0     0     0    -1     1     0     0
%     -1     1     1    -1     0     0     0     0     0     0    -1     1
%      0     0     0     0    -1     1     1    -1     1    -1     0     0
%      0     0     0     0     1    -1    -1     1     0     0     1    -1
% 
% 
% Mc =
% 
%      0
%      1
%      1
%      0
%
% states =
%     M0    M1    M2    M3    M4    M5
%      0     0     0     0     0     1
%      0     0     0     0     0     0
%      0     0     1     0     1     0
%      1     1     0     1     0     0
%      1     0     1     0     0     0
%      0     1     0     0     1     1
%      0     0     0     1     0     0
%      0     0     0     0     0     0
%      0     1     0     1     1     0
%      1     0     1     1     0     0
%      1     1     0     0     0     1
%      0     0     1     0     1     1
% 
% 
% connection =
%  M(:,i)  t(i)  M(:,i)
%      1     4     2
%      1     8     3
%      1    10     4
%      2     3     1
%      2     8     5
%      3     4     5
%      3     7     1
%      4     0     0
%      5     3     3
%      5     7     2
%      5     9     6
%      6     0     0