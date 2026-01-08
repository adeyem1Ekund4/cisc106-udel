%--------------------------------------------------------------------------
% STEREO SPATIALIZATION (FIR CONVOLUTION)
% Description: This section converts a mono signal into a 3D stereo signal 
% by convolving it with Head-Related Impulse Responses (HRIR).
%--------------------------------------------------------------------------

fprintf('--- Processing File Two: Stereo Spatialization ---\n');

% 1. Define Parameters
hrir_file = 'H0e090a.dat'; % HRIR binary data
hrir_len = 128;            % Length of the impulse response

% 2. Load HRIR Data
% Data is stored as interleaved Big-Endian 16-bit integers [L, R, L, R...]
fid = fopen(hrir_file, 'r', 'ieee-be'); 
hrir_raw = fread(fid, 2 * hrir_len, 'short'); 
fclose(fid); 

% Separate interleaved data into Left and Right ear filters
left_filter  = hrir_raw(1:2:end); 
right_filter = hrir_raw(2:2:end); 

% 3. Load Mono Audio
[mono_audio, Fs_stereo] = audioread(input_file); 

% 4. Convolve Mono Signal with Ear Filters
% (Uses the custom convolution helper function defined below)
left_channel  = my_conv(left_filter, mono_audio); 
right_channel = my_conv(right_filter, mono_audio); 

% 5. Format and Save Stereo Output
% Combine channels into a matrix [Left, Right] and normalize
stereo_output = [left_channel(:), right_channel(:)];
stereo_output = stereo_output / (max(abs(stereo_output(:))) * 1.05);

audiowrite('stereo2.wav', stereo_output, Fs_stereo);
fprintf('Success! Files saved: echo.wav, echo2.wav, and stereo2.wav\n');
