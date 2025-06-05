function [y] = my_diff_equation(x, alpha, N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A function to generate the output signal y of the system described by a
% diffence equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% INPUT PARAMETERS---------------------------------------------------------
% x: input signal
% alpha: decreasing amplitude
% N: delay between consecutive echoes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data processing (TO BE COMPLETED BY STUDENTS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OUTPUT PARAMETERS--------------------------------------------------------
% y: output signal

L=length(x);
% Write the code including comments to explain what you are doing



% If you want to check if the code works fine, you can comment all your
% code and replace it with
%             y = filter(1, [1 zeros(1,N-1) -alpha], x)
% which is a built-in function in matlab. The result should be the same.




end