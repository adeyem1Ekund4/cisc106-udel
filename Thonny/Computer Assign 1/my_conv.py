#Adeyemi Ekundayo
import numpy as np
def  myconv(x,h):

############################################################################
# A function to generate the output signal y as convolution of input signal
# x and impulse response signal h
############################################################################

# INPUT PARAMETERS---------------------------------------------------------
# x: input signal
# h: impulse response
    len_x = len(x) # length of x
    len_h = len(h) # length of h
############################################################################
# Data processing: convolution (TO BE COMPLETED BY STUDENTS)

    L= len_x + len_h - 1  
    
    #INPUT----------#
    x_padded=np.pad(x,(0,L-len_x),mode='constant')
    X = np.fft.fft(x_padded)
    #IMPULSE--------#
    h_padded=np.pad(h,(0,L-len_x),mode='constant')
    H = np.fft.fft(h_padded)

############################################################################
# OUTPUT PARAMETERS--------------------------------------------------------

    #---# OUTPUT
    Y = X*H
    y= np.fft.ifft(Y).real  

# y: output signal as convolution of input signal x and impulse response h
    return y
# Write the code including comments to explain what you are doing
    
    
    
