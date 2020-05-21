input_file = input("Enter input file: ")

infile = open(input_file, 'r')

minim = 99999999
maxim = -9999999

for line in infile:
    line = line.strip()
    list1 = line.split(",")
    value = list1[1]
    if int(value) < minim:
        minim = int(value)
    if int(value) > maxim:
        maxim = int(value)

print (minim)
print (maxim)

infile.close()
    
