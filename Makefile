# 定义编译器
CC := gcc
CXX := g++

# 定义文件夹路径
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

# 自动查找所有的源文件
SRC_FILES := $(wildcard $(SRC_DIR)/*.c $(SRC_DIR)/*.cpp)
# 生成对应的目标文件路径
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES)))
# 生成对应的可执行文件路径
BIN_FILES := $(patsubst $(SRC_DIR)/%.c,$(BIN_DIR)/%,$(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%,$(SRC_FILES)))

# 设置编译时的依赖和标志
CPPFLAGS := -Iinclude
CFLAGS   := -Wall
CXXFLAGS := -Wall
LDFLAGS  := -Llib
LDLIBS   := -lfunction

# Debug 编译标志
DEBUGFLAGS := -g -O0

# 默认目标
all: $(BIN_FILES)

# Debug 目标
debug: CPPFLAGS += $(DEBUGFLAGS)
debug: CFLAGS += $(DEBUGFLAGS)
debug: CXXFLAGS += $(DEBUGFLAGS)
debug: $(BIN_FILES)

# 规则：如何从源文件生成可执行文件
$(BIN_DIR)/%: $(OBJ_DIR)/%.o | $(BIN_DIR)
	$(CXX) $(LDFLAGS) $< $(LDLIBS) -o $@

# 规则：如何从源文件生成目标文件
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# 创建必要的目录
$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

# 清理目标
clean:
	$(RM) $(OBJ_FILES) $(BIN_FILES)

# 伪目标
.PHONY: all clean debug
