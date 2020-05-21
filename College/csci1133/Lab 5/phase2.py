import stretch1
def checkPalindrome(str1):
    punctuation = ",.!… "
    for ch in punctuation:
        str1 = str1.replace(ch,"")
    str1 = str1.lower()
    print(str1)
    str2 = stretch1.reverseString(str1)
    print(str2)
    if(str2 == str1):
        return(True)
    else:
        return(False)
