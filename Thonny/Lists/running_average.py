def running_average():
    '''
    Calculate the average.
    '''
    total = 0
    word=""
    num = 0
    count = 0
    word = input("enter number or done")
 
    while word != "done":
   
        if word != "done":
            total = total + int(word)
            word = input("enter number")
            count = count + 1
        else:
            word = "done"
    return total / count