CC ?= gcc
CFLAGS_BENCH ?= -std=gnu99 -O3 -fopenmp
LFLAGS_BENCH ?= -lpng -fopenmp $(LDFLAGS)
CFLAGS_CONV ?= -std=c99 -O3 -fopenmp
LFLAGS_CONV ?= -fopenmp $(LDFLAGS)

TARGET_BENCH ?= qoibench
TARGET_CONV ?= qoiconv

all: $(TARGET_BENCH) $(TARGET_CONV)

bench: $(TARGET_BENCH)
$(TARGET_BENCH):$(TARGET_BENCH).c qoi.h
	$(CC) $(CFLAGS_BENCH) $(CFLAGS) $(TARGET_BENCH).c -o $(TARGET_BENCH) $(LFLAGS_BENCH)

conv: $(TARGET_CONV)
$(TARGET_CONV):$(TARGET_CONV).c qoi.h
	$(CC) $(CFLAGS_CONV) $(CFLAGS) $(TARGET_CONV).c -o $(TARGET_CONV) $(LFLAGS_CONV)

.PHONY: clean
clean:
	$(RM) $(TARGET_BENCH) $(TARGET_CONV)
