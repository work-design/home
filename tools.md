---
title: 模块化开发的工具链
category: about
layout: post
---

由于在项目中采用了模块化开发，相当于把一个大项目拆分成了若干个小项目。从某个角度上来说，增加了项目开发的复杂度。
单一项目开发时涉及到的代码改动，只需要提交一次即可，改成engine开发后，大概率会涉及到多个engine的改动。
提交代码的次数变多，提交代码后又需要更新Gemfile文件，也增加了成本。

如果用传统的方法，这些成本增加的时间消耗无疑是不太划算的。

在长期的实践中，我摸索出了一套工具链的优化方案。

## 解决Gemfile问题


Gemfile文件中正常引用 gem 的路径即可。
```
gem 'rails_com', github: 'work-design/rails_com', branch: 'master'
```

.bundle/config 设置如下
```
BUNDLE_LOCAL__RAILS_COM: "/Users/qin/work/engine/rails_com"

# 此选项会忽略检查分支是否一致。
BUNDLE_DISABLE_LOCAL_BRANCH_CHECK: "true"
```

## 解决批量提交问题
借助IDE的帮助可以轻松解决。

1. 批量Git Commit
在 Tool Window Bars 中找到`9: Version Control`，点击`Commit (⌘K)`，可以批量进行提交。

2. 批量Push

RubyMine 没有提供批量push的功能，我们可以通过git hooks 功能 设置为 commit 发生后自动push


在 .git/hooks 文件夹下创建 `post-commit` 文件，添加以下内容
```sh
#!/bin/sh
git push
```

