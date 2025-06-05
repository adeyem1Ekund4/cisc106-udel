def dealer_plays (score):
    '''
    Three integers as described in the 3-card poker assignment, 
    Returns true if and only if the hand has a queen high or better 
    (i.e., the hand has a "feature" or highest card is at least a queen).
    '''
    a = score[0]
    b = score[1]
    c = score[2]
    if ((a>=12) or (b>=12) or (c>=12)):
        return True
    elif(score_hand(score)>2984):
        return True
    else: 
        return False
assert_equal(dealer_plays([12, 3, 2]), True)
assert_equal(dealer_plays([11, 10, 8]), False)
assert_equal(dealer_plays([9, 9, 9]), True)