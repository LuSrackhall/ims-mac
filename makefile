# 编译器设置
SWIFTC = swiftc
SWIFT_FLAGS = -O
GO = go
GO_FLAGS = -ldflags '-s -w'

# 源文件
SWIFT_SOURCE = refresh-input-focus.swift

# 目标目录设置
DIST = dist
DIST_ARM = dist-arm
DIST_X64 = dist-x64
SWIFT_TARGET_ARM = $(DIST_ARM)/refresh-input-focus
SWIFT_TARGET_X64 = $(DIST_X64)/refresh-input-focus

# ZIP 目标
ZIP_TARGET_ARM = $(DIST)/dist-arm.zip
ZIP_TARGET_X64 = $(DIST)/dist-x64.zip

# 默认目标 - 执行所有编译步骤
all: arm x64

# ARM 架构相关目标
arm: swift-build-arm go-build-arm zip-dist-arm

# X64 架构相关目标
x64: swift-build-x64 go-build-x64 zip-dist-x64

# 创建输出目录
$(DIST_ARM):
		mkdir -p $(DIST_ARM)

$(DIST_X64):
		mkdir -p $(DIST_X64)

$(DIST):
		mkdir -p $(DIST)

# Swift编译规则 - ARM
swift-build-arm: $(SWIFT_TARGET_ARM)

$(SWIFT_TARGET_ARM): $(SWIFT_SOURCE) | $(DIST_ARM)
		$(SWIFTC) $(SWIFT_FLAGS) -target arm64-apple-macosx12.0 $(SWIFT_SOURCE) -o $(SWIFT_TARGET_ARM)

# Swift编译规则 - X64
swift-build-x64: $(SWIFT_TARGET_X64)

$(SWIFT_TARGET_X64): $(SWIFT_SOURCE) | $(DIST_X64)
		$(SWIFTC) $(SWIFT_FLAGS) -target x86_64-apple-macosx10.15 $(SWIFT_SOURCE) -o $(SWIFT_TARGET_X64)

# Go编译规则 - ARM
go-build-arm: swift-build-arm | $(DIST_ARM)
		GOOS=darwin GOARCH=arm64 $(GO) build $(GO_FLAGS) -o $(DIST_ARM)/ims-mac

# Go编译规则 - X64
go-build-x64: swift-build-x64 | $(DIST_X64)
		GOOS=darwin GOARCH=amd64 $(GO) build $(GO_FLAGS) -o $(DIST_X64)/ims-mac

# 压缩规则 - ARM
zip-dist-arm: go-build-arm | $(DIST)
		cd $(DIST_ARM) && zip -r ../$(ZIP_TARGET_ARM) .

# 压缩规则 - X64
zip-dist-x64: go-build-x64 | $(DIST)
		cd $(DIST_X64) && zip -r ../$(ZIP_TARGET_X64) .

# 清理规则
clean:
		rm -rf $(DIST_ARM)
		rm -rf $(DIST_X64)
		rm -rf $(DIST)

.PHONY: all clean arm x64 swift-build-arm swift-build-x64 go-build-arm go-build-x64 zip-dist-arm zip-dist-x64
