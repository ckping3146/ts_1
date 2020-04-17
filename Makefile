
CFLAGS := -g -O2 -W -Wall 
OBJDIR := ../../bin/
SRCS := $(shell find . -name '*.c*')
OBJSTMP := $(filter %.o, ${SRCS:.cpp=.o})
OBJS := $(shell echo "${OBJSTMP}"|sed 's/\.\//\.\.\/\.\.\/bin\//g')
CC = g++

TARGET = ts

.PHONY: all clean

all: ${TARGET}

$(TARGET):	$(OBJS)
	@echo "Generating Target: $(@)"
	@echo "Invoking C++ Linker"
# $@ 目标, $^ 输入列表 $< 第一个输入
	$(CC) -o $(@) $(^) $(CFLAGS)  
	@echo "Finishd Building Target: $(@)"
	@echo ' '

${OBJDIR}%.o:	%.cpp
	@echo "Building file: $(<)"  #第一个输入
	@echo "Invoking C++ Compiler"
	$(CC) -c -o $(@) $(<) $(CFLAGS)
	@echo "Finishd Building $(<)"
	@echo ' '

clean:
	-rm -rf ${OBJS} ${TARGET}
