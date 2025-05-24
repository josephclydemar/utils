CC = clang
CFLAGS = -std=c99 -Wall -Wextra -Werror
INCLUDE = -I include
LFLAGS = 

SOURCE_FILES = $(wildcard src/*.c)
OBJECT_FILES = $(patsubst src/%.c,lib/%.o,$(SOURCE_FILES))
TARGET_BIN = build/target.out

.PHONY: all debug release run clean

all: debug

debug: CFLAGS += -g -fsanitize=address
debug: LFLAGS += -O0
debug: $(TARGET_BIN)

release: CFLAGS += -DNODEBUG
release: LFLAGS += -s -O3
release: $(TARGET_BIN)

run:
	@$(TARGET_BIN)

clean:
	$(RM) $(wildcard build/*)
	$(RM) $(wildcard lib/*)


lib/%.o: src/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(TARGET_BIN): $(OBJECT_FILES)
	$(CC) $(CFLAGS) $^ -o $@ $(LFLAGS)


