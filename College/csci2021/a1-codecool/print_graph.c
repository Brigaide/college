#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "deltas.h"
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

void make_x_axis(int length);
void make_x_axis_numbers(int length);
int min(int *data, int len);
int max(int *data, int len);
int range(int *data, int len);
int y_axis_number(int row_number, float units_per_height, int max);
void print_graph_row(int *data, int rowlabel, int row_number, int len);

void print_graph(int *data, int len, int max_height){                         //starts the print print_graph_row
	int maximum = max(data, len);                                               //calls the max function
	int minimum = min(data, len);                                               //calls the min function
	int rangenum = range(data, len);                                            //calls the range function
	float units_per_height = (((float) rangenum)/max_height);                   //calls the unit per height function


	printf("%s%d\n", "length: ", len);                                          //print functions for the data before the graph
	printf("%s%d\n", "min: ", minimum);
	printf("%s%d\n", "max: ", maximum);
	printf("%s%d\n", "range: ", rangenum);
	printf("%s%d\n", "max_height: ", max_height);
	printf("%s%.2f\n", "units_per_height: ", units_per_height);

	make_x_axis(len);                                                           //calls the top bar
	for(int i = 0; i <= max_height; i++){                                       //for the height of the graph, prints the number and the X's and O's
		int y = y_axis_number(i, units_per_height, maximum);
		print_graph_row(data, y, i, len);
	}
	make_x_axis(len);                                                           //makes another bar
	make_x_axis_numbers(len);                                                   //makes the numbers under the bar

}

void make_x_axis(int length){                                                 //makes the bar that is comprised of "-" and "+"
	int lensofar = 0;
	printf("     ");
	while (lensofar < length){
		if (lensofar%5 == 0){                                                     //every multiple of 5 is +
			printf("+");
		}
		else{
			printf("-");                                                            //else -
		}
		lensofar++;
	}
	printf("\n");

}

void make_x_axis_numbers(int length){                                         //makes the numbers on the x axis
	int increment = length / 5;
	printf("     ");
	for (int i =0; i <= increment; i++){
		printf("%-5d", i*5);
	}
	printf("\n");
}



int min(int *data, int len){                                                  //finds the minimum number of the data set and returns
	int min = data[0];
	for(int i=0; i<len; i++){
		if (min > data[i]){
			min = data[i];
		}
	}
	return min;
}
int max(int *data, int len){                                                  //finds the maximum number of the data set and returns
	int max = data[0];
	for(int i=0; i<len; i++){
		if (max < data[i]){
			max = data[i];
		}
	}
	return max;
}

int range(int *data, int len){                                                //finds the rangs of the data set
	int maxval = max(data, len);
	int minval = min(data, len);
	int rangeval = maxval - minval;
	return rangeval;
}
int y_axis_number(int row_number, float units_per_height, int max){           //prints the y axis number, subtracts from max so numbers descend as you move down graph
	return (int)(max -((row_number * units_per_height)));
}

void print_graph_row(int *data, int rowlabel, int row_number, int len){       //prints the X's and the empty spaces on the graph
	printf("%3d |", rowlabel);
	for(int i = 0; i < len; i++){
		if (data[i] < rowlabel){
			printf(" ");
		}
		else{
			printf("X");
		}
	}
	printf("\n");
}
