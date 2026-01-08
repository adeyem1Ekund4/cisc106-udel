%==========================================================================
% AUDIO SIGNAL PROCESSING: REVERBERATION AND SPATIALIZATION
% 
% This script demonstrates two fundamental digital signal processing (DSP) 
% techniques:
% 1. Recursive Echo Generation: Using an Infinite Impulse Response (IIR) 
%    system to create a decaying echo effect.
% 2. Stereo Spatialization: Using a Finite Impulse Response (FIR) system 
%    to convolve a mono signal with Head-Related Impulse Responses (HRIR) 
%    to simulate sound directionality.
%==========================================================================

clear; % Clear workspace variables
clc;   % Clear command window
close all; % Close all active figures

%--------------------------------------------------------------------------
% SECTION 1: ECHO GENERATION (IIR FILTERING)
%--------------------------------------------------------------------------

% --- Configuration Parameters ---
input_filename = 'speech.wav';   % Source audio file
echo_filename  = 'echo.wav';     % Output via custom difference equation
echo_filename2 = 'echo2.wav';    % Output via MATLAB built-in filter

% LTI System Parameters for Echo:
% N: Delay in samples. 
% alpha: Feedback gain (amplitude scaling). Must be < 1 for stability.
N = 2250; 
alpha = 0.9; 

% --- File Validation ---
if ~exist(input_filename, 'file')
    error('Input file "%s" not found.', input_filename);
end

% --- Parameter Validation ---
if alpha <= 0 || alpha >= 1
    error('Alpha (gain) must be in the range (0, 1) for a stable, decaying echo.');
end
if N <= 0 || mod(N,1) ~= 0
    error('Delay N must be a positive integer.');
end

% --- Load Audio ---
% Fs: Sampling frequency (samples per second)
[Input_signal, Fs] = audioread(input_filename);
fprintf('Echo Delay: %d samples (%.3f seconds at %d Hz).\n', N, N/Fs, Fs);

% --- Process: Custom Difference Equation ---
% Implements: y[n] = x[n] + alpha * y[n-N]
echo = my_diff_equation(Input_signal, alpha, N); 

% --- Process: Built-in Filter Function ---
% The Transfer Function is H(z) = 1 / (1 - alpha * z^-N)
% b (numerator) = 1
% a (denominator) = [1, 0, 0, ..., -alpha] (where -alpha is at index N+1)
echo2 = filter(1, [1 zeros(1, N-1) -alpha], Input_signal);

% --- Normalization and Export ---
% Normalizing to prevent clipping (digital distortion) while maintaining 5% headroom.
norm_factor1 = max(abs(echo));
if norm_factor1 == 0, norm_factor1 = 1; else, norm_factor1 = norm_factor1 * 1.05; end

norm_factor2 = max(abs(echo2));
if norm_factor2 == 0, norm_factor2 = 1; else, norm_factor2 = norm_factor2 * 1.05; end

audiowrite(echo_filename, echo/norm_factor1, Fs);
audiowrite(echo_filename2, echo2/norm_factor2, Fs);

% --- Visualization ---
figure('Name', 'Echo Processing Comparison');
subplot(3,1,1); plot(Input_signal); title('Original Signal'); grid on;
subplot(3,1,2); plot(echo); title('Echo (Custom Diff Equation)'); grid on;
subplot(3,1,3); plot(echo2); title('Echo (MATLAB filter function)'); grid on;
