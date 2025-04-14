package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	imSelectPath := "/Users/srackhalllu/Desktop/资源管理器/safe/ims-mac/resource/im-select"
	refreshPath := "/Users/srackhalllu/Desktop/资源管理器/safe/ims-mac/resource/refresh-input-focus"

	var cmd *exec.Cmd
	if len(os.Args) > 1 {
		err := exec.Command(imSelectPath, os.Args[1]).Run()
		if err != nil {
			fmt.Printf("执行失败: %v\n", err)
			return
		}
		// 只有在有参数时(或者说切换输入法时)刷新焦点
		if err := exec.Command(refreshPath).Run(); err != nil {
			fmt.Printf("执行refresh-input-focus失败: %v\n", err)
		}
	} else {
		cmd = exec.Command(imSelectPath)
		output, err := cmd.CombinedOutput()
		if err != nil {
			fmt.Printf("执行失败: %v\n", err)
			return
		}
		fmt.Print(string(output))
	}
}
