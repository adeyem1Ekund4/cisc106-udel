def has_triple(numlist):
    '''
    Three integers as described in the 3-card poker assignment.
    And returns True if the list has three identical numbers a triple.
    '''
    value1 = numlist[0]
    value2 = numlist[1]
    value3 = numlist[2]
    if (value1 == value2 == value3):
        return True
    else: 
        return False
assert_equal(has_triple([3, 3, 3]), True)
assert_equal(has_triple([3, 14, 3]), False)
assert_equal(has_triple([1,11, 12]), False)