%==========================================================================
% HELPER FUNCTIONS
%==========================================================================

function [y] = my_diff_equation(x, alpha, N)
    % MY_DIFF_EQUATION Implements an IIR feedback loop for echo generation.
    %
    % Difference Equation: y[n] = x[n] + alpha * y[n-N]
    %
    % Inputs:
    %   x     - Input signal vector
    %   alpha - Feedback gain (0 < alpha < 1)
    %   N     - Delay in samples (positive integer)
    %
    % Outputs:
    %   y     - Signal with recursive echoes

    L = length(x);
    y = zeros(L, 1);

    for n = 1:L
        % Current output is current input plus the delayed previous output
        y(n) = x(n);
        if n > N
            y(n) = y(n) + alpha * y(n - N);
        end
    end
end
