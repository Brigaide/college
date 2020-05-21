#def reverseString2(n):
    #newstr = ""
    #for i in n:
        #newstr = i + newstr
    #return newstr

def reverseString(n):
    if len(n) < 1:
        return("")
    else:
        return reverseString(n[1:]) + n[0]
