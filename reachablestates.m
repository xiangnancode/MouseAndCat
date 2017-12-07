function [ states connection ] = reachablestates( Mo, B )
% Function Usage
%
% [ states connection ] = reachablestates( Mo, B ) 
% B is the incident matrix
% Mo is the initial state
% This function will return all possible reachable states and connection between states of the Petri Net
% Each column of output states is a state ( M(:,i) is a state ).
% Each row of output connection shows a firing step with following format.
%
% (state) (transition) (state after firing)
%
% For example,
% connection(1,:) = 1    4    3
% It means from M(:,1), fires t4 can go to M(:,3).
% If the second column is 0, it means no transitions are enabled.

states(:,1) = Mo;% Mo is the first state
state_number = 1;% start from state 1
connection = [];

% This loop is designed to go to every stored state one by one
while state_number <= size(states,2)
    current_state = states(:,state_number);% find out the current state
    t_enabled = firable_transitions( current_state, B );% find out the enabled transitions
    if t_enabled == -1% if none of the transitions are enabled
        % store the connection information as another row
        % [current state number, 0 transitions can fire, no other states can go]
        connection = [connection; state_number 0 0]; 
    else % some of the transitions are enabled
        for i = 1 : length(t_enabled) % for every enabled transitions
            new_state = current_state + B(:,t_enabled(i));% find the new state after one of enabled transitions fires
            duplicate_state = duplicate( states, new_state ); % check if this new state is already stored
            if duplicate_state > 0 % if this new state is already stored
                % store the connection information as another row
                % [current state number, transition fired, state number that the new state duplicates with]
                connection = [connection; state_number t_enabled(i) duplicate_state];
            else % if this new state has not been store yet
                states = [states new_state]; % store the new state as another column
                % store the connection information as another row
                % [current state number, transition fired, new state number]
                connection = [connection; state_number t_enabled(i) size(states,2)];
                
            end
        end
    end
    state_number = state_number + 1;% move on to next state
end

end

