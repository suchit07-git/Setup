PEDANTIC_FLAGS = -Iincludes/debug/includes -std=c++17 -g -Wall -Wextra -Wpedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-variadic-macros -DDEBUG -DLOCAL -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -fsanitize-address-use-after-scope

NORMAL_FLAGS = -Iincludes -std=c++17 -O2 -Wall -DTIMING -DLOCAL -ftree-vectorize -fopt-info-vec

PARALLEL_FLAGS = -fopenmp

D ?= 0

P ?= 0

ifeq ($(D), 1)
	CXXFLAGS = $(PEDANTIC_FLAGS)
else
	CXXFLAGS = $(NORMAL_FLAGS) 
endif
ifeq ($(P), 1)
	CXXFLAGS += $(PARALLEL_FLAGS)
endif

clean:
	find . -maxdepth 1 -type f -executable -delete
	rm -f *.plist
