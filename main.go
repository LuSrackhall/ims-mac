package main

import (
	"embed"
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
)

//go:embed resource
var resources embed.FS

func prepareExecutable(resources embed.FS, tempDir, filename string) (string, error) {
	execPath := filepath.Join(tempDir, filename)
	execFile, err := os.Create(execPath)
	if err != nil {
		return "", fmt.Errorf("创建%s失败: %v", filename, err)
	}
	defer execFile.Close()

	binFile, err := resources.Open("resource/" + filename)
	if err != nil {
		return "", fmt.Errorf("读取%s失败: %v", filename, err)
	}
	defer binFile.Close()

	if _, err := io.Copy(execFile, binFile); err != nil {
		return "", fmt.Errorf("复制%s失败: %v", filename, err)
	}

	if err := os.Chmod(execPath, 0755); err != nil {
		return "", fmt.Errorf("设置%s执行权限失败: %v", filename, err)
	}

	return execPath, nil
}

func main() {
	tempDir, err := os.MkdirTemp("", "im-select")
	if err != nil {
		fmt.Printf("创建临时目录失败: %v\n", err)
		return
	}
	defer os.RemoveAll(tempDir)

	// 准备im-select可执行文件
	imSelectPath, err := prepareExecutable(resources, tempDir, "im-select")
	if err != nil {
		fmt.Printf("%v\n", err)
		return
	}

	// 准备refresh-input-focus可执行文件
	refreshPath, err := prepareExecutable(resources, tempDir, "refresh-input-focus")
	if err != nil {
		fmt.Printf("%v\n", err)
		return
	}

	// 执行im-select
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
