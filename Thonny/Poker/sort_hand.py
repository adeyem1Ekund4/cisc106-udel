def sort_hand(numlist):
    '''
    Accepts a list of three integers as described in the 3-card poker assignment. 
    And returns a list of the same three integers sorted from largest to smallest.
    '''
    value1 = numlist[0]
    value2 = numlist[1]
    value3 = numlist[2]
    if (value1 < value2) and (value2 < value3):
        return [value3,value2,value1]
    elif (value1 > value2) and (value3 > value1):
        return [value3,value1,value2]
    elif (value1 > value2) and (value3 < value2):
        return [value1,value2,value3]
    elif (value1 > value3) and (value3 > value2):
        return [value1,value3,value2]
    elif (value2 > value3) and (value3 > value1):
        return [value2,value3,value1]
    elif (value2 > value1) and (value1 > value3):
        return [value2,value1,value3]
assert_equal(sort_hand([11, 2, 12]),[12, 11, 2])
assert_equal(sort_hand([7, 12, 6]),[12, 7, 6])
assert_equal(sort_hand([2, 7, 9]),[9, 7, 2])   
assert_equal(sort_hand([8, 12, 9]),[12, 9, 8])   
  