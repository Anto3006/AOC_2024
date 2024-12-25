#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "../lib/utilities.h"

enum search_state {
	Initial,
	First_Number,
	Second_Number
};

uint32_t calculate_sum(char*);

int main(int argc, char** argv){
	if (argc > 1){
		printf("%s\n",argv[1]);
		char* data = read_file(argv[1],1,2);
		uint32_t sum = calculate_sum(data);
		printf("Result part 1: %u\n",sum);
		free(data);
	}
}

uint32_t calculate_sum(char* file_data){
	uint32_t sum = 0;
	uint32_t first_number = 0;
	uint32_t second_number = 0;

	enum search_state state = Initial;

	char number_buffer[4];
	size_t number_buffer_pos = 0;

	const char* initial = "mul(";
	size_t initial_search_pos = 0;

	size_t index = 0;
	char current_char = file_data[index];
	bool keep_index = false;
	while(current_char != '\0'){
		keep_index = false;
		if(state == Initial){
			if(current_char == initial[initial_search_pos]){
				initial_search_pos += 1;
				if(initial[initial_search_pos] == '\0'){
					state = First_Number;
					initial_search_pos = 0;
				}
			} else {
				if(initial_search_pos > 1){
					keep_index = true;
				}
				initial_search_pos = 0;
			}
		} else if(state == First_Number){
			if(current_char >= '0' && current_char <= '9'){
				if(number_buffer_pos <= 3){
					number_buffer[number_buffer_pos] = current_char;
					number_buffer_pos++;
				} else {
					state = Initial;
					number_buffer_pos = 0;
				}
			} else if(current_char == ','){
				if(number_buffer_pos == 0){
					state = Initial;
				} else {
					number_buffer[number_buffer_pos] = '\0';
					first_number = atoi(number_buffer);
					state = Second_Number;
					number_buffer_pos = 0;
				}
			} else {
				keep_index = true;
				state = Initial;
				number_buffer_pos = 0;
			}
		} else if(state == Second_Number){
			if(current_char >= '0' && current_char <= '9'){
				if(number_buffer_pos <= 3){
					number_buffer[number_buffer_pos] = current_char;
					number_buffer_pos++;
				} else {
					state = Initial;
					number_buffer_pos = 0;
				}
			} else if(current_char == ')'){
				if(number_buffer_pos == 0){
					state = Initial;
				} else {
					number_buffer[number_buffer_pos] = '\0';
					second_number = atoi(number_buffer);
					state = Initial;
					sum += first_number * second_number;
					number_buffer_pos = 0;
				}
			} else {
				keep_index = true;
				state = Initial;
				number_buffer_pos = 0;
			}
		}

		if(!keep_index){
			index += 1;
		}
		current_char = file_data[index];
	}
	return sum;
}
