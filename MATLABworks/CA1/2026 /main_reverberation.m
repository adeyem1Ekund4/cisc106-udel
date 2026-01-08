%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Software for an application of the reverberation as multiple echoes that
% reach the listener at regular times and have decreasing amplitude. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; % Reset workspace, remove all previous variables
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT PARAMETERS---------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% input WAVE file specified with input_filename
input_filename = 'speech.wav'; 
% output stereo WAVE file specified with stereo_filename
echo_filename = 'echo.wav'; 
echo_filename2 = 'echo2.wav'; 
% LTI system parameters:
%  - delay 
N = 2250; % TO BE COMPLETED BY STUDENTS
%  - amplitude scaling 
alpha = 0.9; % TO BE COMPLETED BY STUDENTS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load input WAVE file specified with input_filename
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Input validation: Check if file exists
if ~exist(input_filename, 'file')
    error('Input file "%s" not found. Please ensure it exists in the current directory.', input_filename);
end

% Parameter validation
if alpha <= 0 || alpha >= 1
    error('Alpha parameter must be between 0 and 1 (exclusive). Current value: %f', alpha);
end

if N <= 0
    error('Delay N must be positive. Current value: %d', N);
end

% Input_signal: sampled sound signal loaded from a WAVE file specified by input_filename  
% Fs: sample rate in Hertz

[Input_signal,Fs] = audioread(input_filename); % Fs and nbits per sample are needed to generate output WAVE file
% display N and N/Fs
sprintf('The delay of N = %f samples corresponds to a delay %f seconds.',N, N/Fs)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data processing: multiple echoes filter (WORK TO BE DONE BY STUDENTS)
% function [echo] = my_diff_equation(Input_signal, alpha, N) filters the
% data in vector Input_signal with the filter described by coefficient N and 
% alpha   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

echo = my_diff_equation(Input_signal, alpha, N); 

% The filter function implements the difference equation: y[n] = x[n] + α·y[n-N]
echo2 = filter(1, [1 zeros(1,N-1) -alpha], Input_signal);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write echo as a WAVE file specified with echo_filename
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Improved normalization: Use max absolute value with small headroom
norm_factor1 = max(abs(echo));
if norm_factor1 == 0
    norm_factor1 = 1; % Avoid division by zero for silent signals
else
    norm_factor1 = norm_factor1 * 1.05; % Add 5% headroom to prevent clipping
end

norm_factor2 = max(abs(echo2));
if norm_factor2 == 0
    norm_factor2 = 1;
else
    norm_factor2 = norm_factor2 * 1.05;
end

audiowrite(echo_filename, echo/norm_factor1, Fs);
audiowrite(echo_filename2, echo2/norm_factor2, Fs);

figure
subplot(3,1,1),plot(Input_signal);
title('Original Signal');
subplot(3,1,2),plot(echo);
title('Echo using my\_diff\_equation');
subplot(3,1,3),plot(echo2);
title('Echo using filter function');
grid on
