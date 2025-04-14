# 编译器设置
SWIFTC = swiftc
SWIFT_FLAGS = -O
GO = go
GO_FLAGS = -ldflags '-s -w'

# 源文件和目标文件
SWIFT_SOURCE = refresh-input-focus.swift
RESOURCE_DIR = resource
DIST_DIR = dist-arm
SWIFT_TARGET = $(RESOURCE_DIR)/refresh-input-focus

# 默认目标 - 执行所有编译步骤
all: swift-build go-build

# 创建输出目录
$(RESOURCE_DIR):
	mkdir -p $(RESOURCE_DIR)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

# Swift编译规则
swift-build: $(SWIFT_TARGET)

$(SWIFT_TARGET): $(SWIFT_SOURCE) | $(RESOURCE_DIR)
	$(SWIFTC) $(SWIFT_FLAGS) $(SWIFT_SOURCE) -o $(SWIFT_TARGET)

# Go编译规则
go-build: swift-build | $(DIST_DIR)
	$(GO) build $(GO_FLAGS) -o $(DIST_DIR)

# 清理规则
clean:
	rm -f $(SWIFT_TARGET)
	rm -rf $(DIST_DIR)

.PHONY: all clean swift-build go-build
