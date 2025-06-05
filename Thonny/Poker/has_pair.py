def has_pair(numlist):
    '''
    Return True if the list has two identical numbers (a "pair"); otherwise, return False. 
    You may assume the list is sorted from largest to smallest values.
    '''
    value1 = numlist[0]
    value2 = numlist[1]
    value3 = numlist[2]
    if (value1 == value2) or (value2 == value3) or (value1 == value3):
        return True
    else:
        return False
assert_equal(has_pair([12, 6, 2]), False)
assert_equal(has_pair([3, 3, 2]), True)
assert_equal(has_pair([12, 2, 2]), True)