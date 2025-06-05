%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
% Software for an application of using a FIR LTI system to process a "mono"
% sound signal and creat a "stereo" signal that produces the feeling that
% the sound source is located in a certain space direction of arrival.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; % Reset workspace, remove all previous variables


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT PARAMETERS---------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Input WAVE file specified with input_filename
input_filename = 'speech.wav'; 
% Output stereo WAVE file specified with stereo_filename
stereo_filename = 'stereo2.wav'; 
% Load impulse response file specified with imp_filename corresponding to
% the desired found direction of arrival, which contains 2*len_imp=256
% samples corresponding to the left/right ear impulse responses appearing
% as [ hl[1] hr[1] hl[2] hr[2]...hl[len_imp] hr[len_imp] ] 
imp_filename = 'H0e090a.dat';
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONSTANT---------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

len_imp = 128; % length of left/right impulse response (fixed)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open and read impulse response file specified with imp_filename
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fp = fopen(imp_filename, 'r', 'ieee-be'); % open imp_filename
data = fread(fp, 2*len_imp, 'short'); % read impulse response from file to vector data
fclose(fp); % close imp_filename

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load input WAVE file specified with input_filename
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% mono: sampled sound signal loaded from a WAVE file specified by input_filename  
% Fs: sample rate in Hertz
% nbits: the number of bits per sample
[mono,Fs] = audioread(input_filename); 
% load input WAVE file as mono with sample rate Fs and the number of bits per sample, which are needed to generate output stereo WAVE file
% Fs must be equal to 44.1KHz
if (Fs~=44100) % if Fs is not equal to 44100
    error('Fs is not 44.1 KHz'); % display error and abort
end
len_mono = length(mono); % length of mono

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Impulse response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

leftimp  = data(1:2:2*len_imp); % left ear impulse response: hl[1]...hl[len_imp]
rightimp = data(2:2:2*len_imp); % right ear impulse response: hr[1]...hr[len_imp]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data processing (WORK TO BE DONE BY STUDENTS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

leftchannel  = my_conv(leftimp, mono); % convolution of left ear impulse response and mono
rightchannel = my_conv(rightimp, mono); % convolution of left ear impulse response and mono


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Convolution function offered by Matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% leftchannel  = conv(leftimp, mono); % convolution of left ear impulse response and mono
% rightchannel = conv(rightimp, mono); % convolution of left ear impulse response and mono


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write the stereo data as a WAVE file specified with stereo_filename
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
leftchannel  = reshape(leftchannel , length(leftchannel ), 1); % change leftchannel into a column vector
rightchannel = reshape(rightchannel, length(rightchannel), 1); % change rightchannel into a column vector
norml = max(abs([leftchannel; rightchannel]))*1.05; % normalization factor: chosen to guarantee that
                                                    % stored signal is within the range [-1,1], so 
                                                    % clipping is avoided when writing the
                                                    % output file
audiowrite(stereo_filename, [leftchannel rightchannel]/norml, Fs);

