def has_straight(value):
    '''
    Three integers (hand) as described in the 3-card poker assignment, 
    And returns True if and only if the list is in direct order from largest to smallest. 
    '''
    if value[0] == (value[1]+1) and value[1] == (value[2]+1):
        return True
    else: 
        return False
assert_equal(has_straight([11, 10, 9]), True)
assert_equal(has_straight([11, 8, 9]), False)
assert_equal(has_straight([9, 10, 11]), False)
