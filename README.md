<div align="center">
<h1>ims-mac</h1>
</div>

<div align="center">
<strong>
<samp>

[English](README.md) · [简体中文](README.zh-CN.md)

</samp>
</strong>
</div>

A macOS input method selection tool based on [im-select](https://github.com/daipeihust/im-select), but with more stable performance and seamless replacement capability.

**Working Principle**

Quickly refreshes input focus by generating a temporary window to actively activate the input method.
> This high-performance, painless approach perfectly solves the current macOS platform bug where input methods with candidate boxes (such as all Chinese input methods) may occasionally fail to activate properly when only using system API calls to switch input methods.

**Advantages Over Other Solutions**

This solution is non-intrusive and nearly identical to native API switching. See [this analysis](https://github.com/LuSrackhall/switch-input-method/issues/2) for detailed information.
> Unless Apple fixes the input method switching API bug in the future, this is currently the most perfect solution. We also welcome more clever mechanism solutions for comparison.

Due to the significant advantages of this solution:
* The [macism](https://github.com/laishulu/macism) project, which has been dedicated to solving this problem in the community, also switched from simulating keyboard input to using this mechanism in v2 to improve performance and switching reliability.
* I also shared insights about potentially incorporating this solution with the [im-select](https://github.com/daipeihust/im-select) project community -> [see this link](https://github.com/daipeihust/im-select/issues/86).

## Installation

### Using Homebrew (Recommended)

```bash
brew install lusrackhall/tap/ims-mac
```

> The final installation path through brew is typically: `/opt/homebrew/bin/`

**To uninstall, use the following command**:

```bash
brew uninstall lusrackhall/tap/ims-mac
```

> Only applicable if installed via brew. If you installed manually, please refer to the installation and uninstallation instructions on the release page.

### Manual Installation

Please visit the [release page](https://github.com/LuSrackhall/ims-mac/releases) for installation.

## Thanks

[im-select](https://github.com/daipeihust/im-select) project
> Before using macOS, I had been using the im-select project on Windows for many years. This project was initially based on im-select for further implementation.

[macism](https://github.com/laishulu/macism) project author
> The temporary window method was initially just a solution I conceived but hadn't implemented for my [personal project switch-input-method](https://github.com/LuSrackhall/switch-input-method) to address related issues
>
>> Since the original solution was sufficient for personal use, I hadn't proceeded with implementation.
>
> However, simple [communication](https://github.com/rime/squirrel/issues/866#:~:text=%E5%85%B6%E5%AE%9E%E6%88%91%E9%97%AE%E7%9A%84%E6%98%AF%EF%BC%9A%20full,%E6%9C%BA%E5%88%B6%2D%2D%E4%B8%B4%E6%97%B6%E7%AA%97%E5%8F%A3%E8%A7%A3%E5%86%B3%E6%B3%95%E3%80%82) with [laishulu](https://github.com/laishulu) accelerated my implementation of this approach, and prompted me immediately after successful verification to:
> * Share insights about the temporary window method with everyone.
> * Separate the complete solution from my personal project (giving birth to the current [ims-mac](https://github.com/LuSrackhall/ims-mac) project) to share and help more people.
>
> Influenced by this insight, the [macism](https://github.com/laishulu/macism) project completely removed its original core keyboard input simulation mechanism in v2 and switched to the same temporary window mechanism as this project. This upgrade greatly improved macism's performance and switching reliability.

