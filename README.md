# ims-mac

一个mac平台下基于 [im-select](https://github.com/daipeihust/im-select) 的输入法选择工具, 但效果更稳定, 可与之无缝替换。

**实现原理**

通过生成 临时窗口 的方式快速刷新输入焦点, 以达到主动激活输入法的目的。
> 高性能无痛式的完美解决了目前mac平台->因仅通过系统调用api切换输入法时bug(即所有带候选框的输入法(如所有中文输入法)有几率无法正常激活的bug。)

**相比其它方案的优势**

此方案无侵入且无限接近原生api直接切换的效果, 可见[此分析](https://github.com/LuSrackhall/switch-input-method/issues/2)详细了解
> 除非后续官方修复输入法切换相关api调用的bug, 否则这就是目前最完美的解决方案。当然也欢迎更多的取巧方案机制纳入对比。

由于此方案非常具有优势:
* 社区中一直致力于解决此问题的 [macism](https://github.com/laishulu/macism) 项目也在v2版本从模拟键盘输入的方式改为使用此机制来提升性能和切换的可靠性。
* 我也向[im-select](https://github.com/daipeihust/im-select)项目社区提出了关于是否引入此解决方案的的相关见解->[见此链接](https://github.com/daipeihust/im-select/issues/86)。

## 安装

### 使用 Homebrew 安装

```bash
brew install lusrackhall/tap/ims-mac
```

### 手动安装

请前往[release页面](https://github.com/LuSrackhall/ims-mac/releases)进行安装。

## 鸣谢

[im-select](https://github.com/daipeihust/im-select)项目
> 使用mac之前, 在win平台的多年来一使用的就是im-select项目。 本项目最开始也是基于im-select来进一步实现的。

[macism](https://github.com/laishulu/macism)项目的作者
> 正是与[laishulu](https://github.com/laishulu)的不断交流, 以及其[对我原有解决方案中潜在bug的持续发现与提问](https://github.com/rime/squirrel/issues/866#:~:text=%E5%85%B6%E5%AE%9E%E6%88%91%E9%97%AE%E7%9A%84%E6%98%AF%EF%BC%9A%20full,%E6%9C%BA%E5%88%B6%2D%2D%E4%B8%B4%E6%97%B6%E7%AA%97%E5%8F%A3%E8%A7%A3%E5%86%B3%E6%B3%95%E3%80%82), 才让我在解决bug过程中想到了 临时窗口 这一全新的取巧机制。