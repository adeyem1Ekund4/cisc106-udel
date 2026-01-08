%==========================================================================
% HELPER FUNCTIONS
%==========================================================================

function [y] = my_conv(h, x)
    % MY_CONV Performs 1D convolution between impulse response h and signal x.
    %
    % Formula: y[n] = sum_{k=0}^{M-1} h[k] * x[n-k]
    %
    % Inputs:
    %   h - Impulse response vector (Filter coefficients)
    %   x - Input signal vector
    %
    % Outputs:
    %   y - Resulting convolved signal (Length: length(h) + length(x) - 1)

    if isempty(x) || isempty(h), error('Inputs cannot be empty'); end
    
    L = length(x);
    M = length(h);
    y = zeros(L + M - 1, 1);

    % Manual convolution implementation using nested loops
    for n = 1:(L + M - 1)
        for k = 1:M
            x_idx = n - k + 1;
            if x_idx >= 1 && x_idx <= L
                y(n) = y(n) + h(k) * x(x_idx);
            end
        end
    end
end
