# Makefile for compiling C++ program

CXX := g++
CXXFLAGS := -std=c++11 -Wall -Wextra -Wpedantic

# Find all .cpp files in the current directory
SRCS := $(wildcard *.cpp)

# Generate corresponding object file names
OBJS := $(SRCS:.cpp=.o)

# Find all .h files in the current directory
HDRS := $(wildcard *.h)

# Default target: compile and link the program
app: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files into object files
%.o: %.cpp $(HDRS)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Clean target: remove all generated files
clean:
	rm -f app $(OBJS)
