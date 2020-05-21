morse = {'A':'. _','B':'_ . . .','C':'_ . _ .','D':'_ . .','E':'.', \
 'F':'. . _ .','G':'_ _ .','H':'. . . .','I':'. .','J':'. _ _ _' \
 ,'K':'_ . _','L':'. _ . .','M':'_ _','N':'_ .' ,'O':'_ _ _' \
 ,'P':'._ _.','Q':'_ _ . _','R':'. _ .','S':'. . .','T':'_','U':'. . _' \
 ,'V':'. . . _','W':'. _ _','X':'_ . . _','Y':'_ . _ _','Z':'_ _ . .', ' ':"\n"}

phrase = input("enter a phrase: ")
punctuation = ",.!…"

for ch in punctuation:
    phrase = phrase.replace(ch, "")

phrase = phrase.upper()
print(phrase)
for ch in phrase:
    print(morse[ch])
