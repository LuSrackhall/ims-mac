class ImsMac < Formula
  desc "Input Method Status tool for macOS"
  homepage "https://github.com/LuSrackhall/ims-mac"
  version "0.2.0"

  on_arm do
    url "https://github.com/LuSrackhall/ims-mac/releases/download/v#{version}/dist-arm.zip"
    sha256 "51cba98c71877bdee1ce974a51c2f3c503dd6d1c85189bfb56274f8bcaa35529"
  end

  on_intel do
    url "https://github.com/LuSrackhall/ims-mac/releases/download/v#{version}/dist-x64.zip"
    sha256 "58a5bd8015dc9252b3e0d82fe88ba7245cdb4d0a856885ba1851d2ef33c38fd9"  # 需要替换为实际的 Intel 版本 SHA256
  end

  def install
    bin.install "ims-mac"
    bin.install "refresh-input-focus"
    bin.install "im-select__ims-mac"
  end

  def uninstall
    # 列出所有历史版本可能存在的文件，不存在也不会报错
    rm_f "#{bin}/ims-mac"
    rm_f "#{bin}/refresh-input-focus"
    rm_f "#{bin}/im-select__ims-mac"
    
    # 配置文件同理
    rm_f "#{ENV["HOME"]}/.ims-mac-config"
    rm_f "#{ENV["HOME"]}/.ims-mac-v#{version.delete(".")}-data"
  end

  test do
    # 测试所有二进制文件是否存在
    assert_predicate bin/"ims-mac", :exist?
    assert_predicate bin/"refresh-input-focus", :exist?
    assert_predicate bin/"im-select__ims-mac", :exist?
    
    # 简单运行测试
    system "#{bin}/ims-mac",   # 或其他合适的参数
  end
end
