# 编译器设置
SWIFTC = swiftc
SWIFT_FLAGS = -O
GO = go
GO_FLAGS = -ldflags '-s -w'

# 源文件和目标文件
SWIFT_SOURCE = refresh-input-focus.swift
DIST_DIR = dist-arm
SWIFT_TARGET = $(DIST_DIR)/refresh-input-focus

# 添加dist目录变量
DIST = dist
ZIP_TARGET = $(DIST)/dist-arm.zip

# 默认目标 - 执行所有编译步骤
all: swift-build go-build zip-dist

# 创建输出目录
$(DIST_DIR):
	mkdir -p $(DIST_DIR)

# Swift编译规则
swift-build: $(SWIFT_TARGET)

$(SWIFT_TARGET): $(SWIFT_SOURCE) | $(DIST_DIR)
	$(SWIFTC) $(SWIFT_FLAGS) $(SWIFT_SOURCE) -o $(SWIFT_TARGET)

# Go编译规则
go-build: swift-build | $(DIST_DIR)
	$(GO) build $(GO_FLAGS) -o $(DIST_DIR)

# 压缩规则
$(DIST):
	mkdir -p $(DIST)

zip-dist: go-build | $(DIST)
	cd $(DIST_DIR) && zip -r ../$(ZIP_TARGET) .

# 清理规则
clean:
	rm -rf $(DIST_DIR)
	rm -rf $(DIST)

.PHONY: all clean swift-build go-build zip-dist
