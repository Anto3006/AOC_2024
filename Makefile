CC = gcc
CFLAGS = -Wall -Wextra -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wstrict-prototypes -Wstrict-overflow -Wwrite-strings -std=c2x
BUILD_DIR := ./build
EXEC_DIR := ./bin

all: \
	vector \
	utilities \
	day01 \
	day02 \
	day03 \
	day04 \
	day05 \
	day06 \
	day07 \
	day08

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

day03: src/day_3.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@

day04: src/day_4.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@

day05: src/day_5.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@

day06: src/day_6.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@

day07: src/day_7.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@

day08: src/day_8.c utilities vector
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@.o
	$(CC) $(CFLAGS) $(BUILD_DIR)/$@.o $(BUILD_DIR)/utilities.o $(BUILD_DIR)/vector.o -o $(EXEC_DIR)/$@
