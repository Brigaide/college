input_file = input("enter file name: ")

infile = open(input_file, 'r')
filestring = infile.read()
alphabetlist = 'abcdefghijklmnopqrstuvwxyz'

for ch in alphabetlist:
    print("number of occurances of ", ch, "in file is", filestring.count(ch))

    

