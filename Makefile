CC = gcc
CFLAGS = -Wall -Wextra -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wstrict-prototypes -Wstrict-overflow -Wwrite-strings -std=c2x
BUILD_DIR := ./build
EXEC_DIR := ./bin

all: \
	vector \
	utilities \
	day01 \
	day02

vector: lib/vector.c
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o

utilities: lib/utilities.c
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o

day01: src/day_1.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@

day02: src/day_2.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@
