<div align="center">
<h1>ims-mac</h1>
</div>

<div align="center">
<strong>
<samp>

[简体中文](README.zh-CN.md) · [English](README.md)

</samp>
</strong>
</div>

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

### 使用 Homebrew 安装(推荐)

```bash
brew install lusrackhall/tap/ims-mac
```

> 通过brew方式的最终安装路径通常是:`/opt/homebrew/bin/`

**如果需要卸载, 可以使用以下命令**:

```bash
brew uninstall lusrackhall/tap/ims-mac
```

> 仅适用于通过brew安装的情况, 如果您是手动安装, 请参考release页面的安装卸载说明。

### 手动安装

请前往[release页面](https://github.com/LuSrackhall/ims-mac/releases)进行安装。

## 鸣谢

[im-select](https://github.com/daipeihust/im-select)项目
> 使用mac之前, 在win平台的多年来一使用的就是im-select项目。 本项目最开始也是基于im-select来进一步实现的。

[macism](https://github.com/laishulu/macism)项目的作者
> 临时窗口法 最开始只是我为[自用项目switch-input-method](https://github.com/LuSrackhall/switch-input-method)解决相关问题构思创立却并未实施的解决方案
>
>> 由于原方案足够自用就一直没有着手实施。
>
> 但与[laishulu](https://github.com/laishulu)的简单[交流](https://github.com/rime/squirrel/issues/866#:~:text=%E5%85%B6%E5%AE%9E%E6%88%91%E9%97%AE%E7%9A%84%E6%98%AF%EF%BC%9A%20full,%E6%9C%BA%E5%88%B6%2D%2D%E4%B8%B4%E6%97%B6%E7%AA%97%E5%8F%A3%E8%A7%A3%E5%86%B3%E6%B3%95%E3%80%82)加速了我个人对这一方式的实施进度, 也促使我在验证成功后的第一时间:
> * 与大家分享 临时窗口法 的相关见解。
> * 将完整解决方案从自用项目中独立出来(诞生了当前的[ims-mac](https://github.com/LuSrackhall/ims-mac)项目), 分享并帮助更多的人。
>
> 受此见解影响, [macism](https://github.com/laishulu/macism)项目在v2版本中彻底删除了原本核心的模拟键盘输入机制, 改为与本项目相同的 临时窗口机制。这一升级, 帮助macism项目大大提升了性能和切换的可靠性。