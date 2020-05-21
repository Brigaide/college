def maxValue(ints):
    if(len(ints)==1):
        return(ints[0])
    else:
        tempmax = maxValue(ints[1:])
        if(tempmax<ints[0]):
            tempmax = ints[0]
        return(tempmax)
