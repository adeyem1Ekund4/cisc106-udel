def running_total():  
    '''
    Prints out sum.
    '''
    total = 0
    word=""
    num = 0

    word = input("enter number or done")
 
    while word != "done":
   
        if word != "done":
            total = total + int(word)
            word = input("enter number")
        else:
            word = "done"
    return total
 

    

    