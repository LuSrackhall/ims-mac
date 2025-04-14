import Cocoa

class StatusBarController: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 200, height: 40),
            styleMask: [.borderless], // 简化窗口样式
            backing: .buffered,
            defer: false
        )
        
        window.backgroundColor = NSColor(white: 1.0, alpha: 0.95)
        window.level = .screenSaver
        window.alphaValue = 1.0
        
        // 简化视觉效果视图
        let effectView = NSVisualEffectView(frame: window.contentView!.bounds)
        effectView.material = .popover
        effectView.state = .active
        
        // 调整文本框位置和大小
        let textField = NSTextField(frame: NSRect(
            x: 10,
            y: 8,
            width: window.contentView!.bounds.width - 20,
            height: 24
        ))
        textField.font = NSFont.systemFont(ofSize: 13)
        textField.bezelStyle = .roundedBezel
        textField.isEditable = true
        textField.isSelectable = true
        (textField.cell as? NSSecureTextFieldCell)?.echosBullets = true
        textField.cell = NSSecureTextFieldCell()  // 设置为密码输入模式
        
        class TextFieldDelegate: NSObject, NSTextFieldDelegate {
            func controlTextDidChange(_ obj: Notification) {
                print("Text changed: \((obj.object as? NSTextField)?.stringValue ?? "")")
            }
            
            func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
                if commandSelector == #selector(NSResponder.cancelOperation(_:)) {
                    NSApplication.shared.terminate(nil)
                    return true
                }
                return false
            }
        }
        
        let delegate = TextFieldDelegate()
        textField.delegate = delegate
        
        window.contentView?.addSubview(effectView)
        window.contentView?.addSubview(textField)
        
        // 设置初始响应者
        window.initialFirstResponder = textField
        
        // 设置固定位置显示窗口
        window.setFrameOrigin(NSPoint(x: 0, y: 0))
        
        // 显示窗口并确保焦点
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        window.makeFirstResponder(textField)
        textField.becomeFirstResponder()
        
        // DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
        textField.becomeFirstResponder()
        NSApplication.shared.terminate(nil)
        // }
    }
}

let app = NSApplication.shared
NSApp.setActivationPolicy(.accessory) // 使用accessory策略代替regular
let controller = StatusBarController()
app.delegate = controller
app.run()