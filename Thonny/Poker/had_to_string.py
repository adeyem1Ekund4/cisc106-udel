def hand_to_string (numlist):
    '''
    Accepts three intergers and returns string of suitible for showing the hand to the player.
    '''
    value1 = numlist[0]
    value2 = numlist[1]
    value3 = numlist[2]
    letter_card_value = {10: "X", 11: "J", 12: "Q", 13: "K", 14: "A"}
    if value1 < 10:
        card1 = str(value1)
    else:
        card1 = letter_card_value[value1]
    if value2 < 10:
        card2 = str(value2)
    else:
        card2 = letter_card_value[value2]
    if value3 < 10:
        card3 = str(value3)
    else:
        card3 = letter_card_value[value3]
    return card1+" "+card2+" "+card3
assert_equal(hand_to_string([7, 4, 13]), "7 4 K")
assert_equal(hand_to_string([3, 4, 5]), "3 4 5")
assert_equal(hand_to_string([10, 14, 12]), "X A Q")