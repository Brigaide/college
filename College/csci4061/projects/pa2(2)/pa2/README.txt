/* test machine : CSEL-KH4250-04
* date : 10 / 27 / 19
* name : Luke Peterson, Bridget Gururaj
* x500 : pet00883 , gnana005
*/

• The purpose of your program
The purpose is to count the number of words that start with each letter of the
alphabet in a series of txt files which are nested. The goal of it is to do it by
splitting the work evenly into several mappers, which are determined by input.


• How to compile the program
make
./mapreduce [TestCase] [mapper amount]


• What exactly your program does
This program counts the number of words that start with each letter of the
alphabet by recursively searching through directories until all of the text files
are found and by doing so, it splits them among m mapper_i.txt files, where m is
user input. fork() is called m times and m pipes are created so that later the
letter counts are summed. Finally, the output is printed to FinalResult.txt instead
of stdout.


• Any assumptions outside this document
No assumptions were made


• Your and your partners individual contributions
The work was divided equally. Both partners were present during all parts of the
code-writing process.


• If you have attempted extra credit
Nope.
