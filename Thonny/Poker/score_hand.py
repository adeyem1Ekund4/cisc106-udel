def score_hand(score):
    '''
    Three integers as described in the 3-card poker assignment, 
    And returns the value as described in the project instructions.
    '''
    a = score[0]
    b = score[1]
    c = score[2]
    if (has_straight(score)==True):
        x=15
        return((x*16**3)+(a*16**2)+(b*16)+c)
    if (has_triple(score)==True):
        x=16
        return((x*16**3)+(a*16**2)+(b*16)+c)
    if (has_pair(score)==True):
        if(a==b) or (a==c):
            x = a
        elif(b==a) or (b==c):
            x=b
        elif(c==a) or (c==b):
            x=c
        return((x*16**3)+(a*16**2)+(b*16)+c)
    else:
        return((a*16**2)+(b*16)+c)
    
assert_equal(score_hand([3,3,3]), 66355)
assert_equal(score_hand([12,9,9]), 40089)
assert_equal(score_hand([12,11,10]), 64698)
    