# Flex Sans 械黑

![Banner image 横幅](./documentation/display.gif)

## 目标 Target

IBM Plex 是 IBM 公司于 2017 年发布的开源字体项目，最初预告会制作相应的 CJK（中日韩）字体，但经历多次延期，直到 2021 年才发布日文版、2024 年发布繁体版延续了西文部分的独特设计风格。然而，简体版（IBM Plex Sans SC）却因大量不必要的修改和设计问题备受批评。2025 年 4 月，IBM 发布了 Plex 的字体源代码。我们借此机会修复 IBM Plex Sans SC 的问题，并制作了可变字体版本，命名为 **械黑**。   
IBM Plex is an open-source font project released by IBM in 2017. Initially, it was announced that corresponding CJK (Chinese, Japanese, Korean) fonts would be created, but after multiple delays, the Japanese version was not released until 2021. The Traditional Chinese version released in 2024 continued the unique design style of the Latin part. However, the Simplified Chinese version (IBM Plex Sans SC) faced heavy criticism due to numerous unnecessary modifications and design issues. In April 2025, IBM released the source code for Plex fonts. We took this opportunity to address the issues in IBM Plex Sans SC and created a variable font version with Chinese characters, which is named **Flex Sans**.

更详细的资料可见[猫啃网](https://maoken.com/freefonts/26125.html)：https://maoken.com/freefonts/26125.html 。  
More details about this project can be viewed on [maoken.com](https://maoken.com/freefonts/26125.html): https://maoken.com/freefonts/26014.html .

## 版本差异 Version differences

本计划目前只完成 GB 版的修改工作。以下列出各版本的工作计划及差异：  
This project has only completed modifications for the GB version. Below lists the plan and differences for various versions:

* GB（国标）：尽可能贴近中国国家标准字形，但部分笔形保留 Plex 独特的油墨陷阱设计而不追求笔画正确。
  As close as possible to the China national standard glyphs, but some strokes retain Plex’s unique ink trap design instead of the correct stroke.

* SC（简中）：保留 Plex JP/TC 中原有的印刷字形风格，但贴近简体中文日常使用字形。  
  Retain traditional printing stroke designs that are in Plex JP/TC but closer to what SC users see daily.

## 授权 Licensing 授權

### 字库文件 Font Files 字型文件

本字体基于 SIL Open Font License v1.1 （SIL 开源字型授权，1.1 版）修改 IBM Plex Sans SC。  
This font is modified from IBM Plex Sans SC under SIL Open Font License v1.1.

本字体亦在 SIL Open Font License v1.1 （SIL 开源字型授权，1.1 版）下公开发布，详细的授权条款可参阅 [License 文件](./OFL.txt)（[简中译版参考](./OFL_ZHS.txt)）。  
This font is also publicly released under SIL Open Font License v1.1. Please refer to the [License file](./OFL.txt) for details of the license.

在此授权下，您可以：  
Under this license, you can:

- **自由商用 Free for commercial use**  
无需付费、知会或标明作者即可自由使用此字体，也可用于商业应用。  
Use the font with no payment or attribution to the author including commercial use.
  
- **自由散播 Free for redistribution**  
可以把字体嵌入到任何系统或软件中，而无须取得书面授权。  
Embed the font into any systems and software without requiring written permission.
  
- **自由修改 Free for modification**  
可以把字体修改重制成其它字库，但是修改后的字库也必须要依 SIL Open Font License （SIL 开源字型授权）释出。  
Modify the font into other fonts, but the modified font must be also released under SIL Open Font License.

## 构建字型 | Building the Font

本字体制作流程分两部分：非汉部分（提供字体信息、西文、标点符号、OpenType特性等）及中文部分（提供汉字和异体）。非汉部分使用 FontLab 8 制作，打开 `sources/Flex Sans GB VF latin.vfc` 后导出 "DesignSpace + UFO"（根据家族子文件夹）。中文部分使用 Fontra 共享服务，导出格式为 `.rcjk`，需后续转换成 UFO 文件。两者导出后运行 `./sources/build.ps1` 即可构建完整字体。  
The workflow for this fonts is separated into two parts: non-Chinese (providing font information, LCG, punctuations, OpenType features, etc.) and Chinese (Chinese characters with variants). Non-Chinese part is made in FontLab 8, which can be exported from `sources/Flex Sans GB VF latin.vfc` with "DesignSpace + UFO" (subfolder by family). Chinese part is made with collaborative Fontra service, and exports `.rcjk` file that require conversion to UFO. The build can be done by running `./sources/build.ps1` after exporting both fonts.

请安装 Python 后安装 `requirements.txt` 里面的依赖。以下列出特殊需要的版本：  
After installing Python, install the dependencies listed in `requirements.txt`. Special required versions are listed below:

* ufo2ft（ https://github.com/NightFurySL2001/ufo2ft/tree/patch-multilingual-name ）: 特殊修改以构建多语言名称 modified to export multilingual names
* [fontra](https://github.com/googlefonts/fontra) & [fontra-rjk](https://github.com/googlefonts/fontra-rcjk)：从 `.rcjk` 导出 `.ufo` exports `.ufo` out of `.rcjk`

## 致谢 | Acknowledgements

特别感谢以下团队成员：  
Special thanks to the following team members and supporters:

- **字形修改 | Glyph Modifications**：Lakejason0（湖 远星）、Luke036（Scott0107000）、ZERO子、orj
- **难字调整 | Difficult Glyph Adjustments**：酣醒、Zonz、夜煞之乐（NightFurySL2001）
- **字形优化 | Glyph Optimization**：躁动（Tsao Tung）、绵云饴里
- **文案提供 | Documentation**：躁动（Tsao Tung）、Zonz、Lakejason0（湖 远星）
- **服务器支持 | Server Support**：猫啃网、夜煞之乐（NightFurySL2001）
- **IBM Plex 开源 | IBM Plex Open Source**：IBM