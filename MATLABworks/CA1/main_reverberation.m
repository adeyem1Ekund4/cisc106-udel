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

% Input_signal: sampled sound signal loaded from a WAVE file specified by input_filename  
% Fs: sample rate in Hertz

[Input_signal,Fs] = audioread('speech.wav'); % Fs and nbits per sample are needed to generate output WAVE file
% display N and N/Fs
sprintf('The delay of N = %f samples corresponds to a delay %f seconds.',N, N/Fs)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data processing: multiple echoes filter (WORK TO BE DONE BY STUDENTS)
% function [echo] = my_diff_equation(Input_signal, alpha, N) filters the
% data in vector Input_signal with the filter described by coefficient N and 
% alpha   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

echo = my_diff_equation(Input_signal, alpha, N); 

echo2 =filter(1, [1 zeros(1,N-1) -alpha], Input_signal);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write echo as a WAVE file specified with echo_filename
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

norml = max(abs(echo))*1.05; % normalization factor: chosen to guarantee that
                             % echo/norml is within the range [-1,1], so 
                             % clipping is avoided when storing the
                            % output file
norm2 = max(abs(echo2))*1.05;

audiowrite(echo_filename, echo/norml , Fs);
audiowrite(echo_filename2, echo2/norm2 , Fs);

figure
subplot(3,1,1),plot(Input_signal);
subplot(3,1,2),plot(echo);
subplot(3,1,3),plot(echo2);
grid on



