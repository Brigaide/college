import random

output_file = input("Enter name of output file: ")

outfile = open(output_file, "w")

line1 = 1

while line1 <= 1000:

    line2 = random.randint(-1000,1000)
    line = str(line1) + "," + str(line2) + '\n'
    outfile.write(line)
    
    line1 = line1 + 1


outfile.close()
