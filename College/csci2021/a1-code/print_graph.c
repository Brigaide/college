#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "deltas.h"
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

void print_graph(int *data, int len, int max_height){



}
int find_min(int *data){
	int t = data[0];
	for(int i=1; i<sizeof

// Prints a graph of the values in data which is an array of integers
// that has len elements. The max_height argument is the height in
// character rows that the maximum number data[] should be.  A sample
// graph is as follows:
//
// length: 50
// min: 13
// max: 996
// range: 983
// max_height: 10
// units_per_height: 98.30
//      +----+----+----+----+----+----+----+----+----+----
// 996 |                X
// 897 |       X        X X            X
// 799 |  X    X X   X  X X    X       X                X
// 701 |  XX   X X   X  XXX    X      XX   XXX    X   X XX
// 602 |  XX   X X  XX  XXX X  X      XX  XXXX    XX  X XX
// 504 |  XX   XXX  XX  XXX XX X      XXX XXXX XX XX  X XX
// 406 |  XX X XXX XXXX XXX XX X  XXX XXX XXXXXXXXXX  X XX
// 307 | XXX X XXX XXXXXXXXXXX X XXXX XXXXXXXXXXXXXXX X XX
// 209 | XXX XXXXXXXXXXXXXXXXX XXXXXX XXXXXXXXXXXXXXXXX XX
// 111 | XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//  13 |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//      +----+----+----+----+----+----+----+----+----+----
//      0    5    10   15   20   25   30   35   40   45
