# Git Submodule 使用指南

## 初始化

1. 下载 engine 汇总项目：`git clone git@github.com:work-design/engine.git`
2. 进入到刚 clone 的 engine 目录中，初始化 engine: `git submodule update --init`
3. `git submodule foreach git checkout main`


## 新增一个 submodule

`git submodule add git@github.com:username/xxx.git rails_xxx`

上面的命令会更新`.gitsubmodules`文件：
```yaml
[submodule "rails_xxx"]
  path = rails_xxx
  url = git@github.com:username/xxx.git
```

## 更新

* 除了更新汇总项目，同时会将有更新的模块(submodule)项目下的代码一并 `git fetch` 到本地
`git pull`

* 已 fetch 到本地的模块代码，还未合并，执行下面两个命令的任何一个：
  * `git submodule update --rebase`：采用 rebase 模式合并远端代码到本地；
  * `git submodule update --merge`：采用 merge 模式合并远端代码到本地；

4. 配置`bundle`


所以我们建议您使用`bundle config`命令来拦截`Gemfile`中的设置。每次`bundle install`时从本地文件获取`Gem`，而不是从远程网络中获取。您可以这样做：

```shell
bundle config local.rails_xxx ~/your_main_project_path/engine_path/rails_xxx
```

这个命令会修改`~/.bundle/config`文件，会在文件末尾添加：

```
BUNDLE_LOCAL__RAILS_XXX: "~/your_main_project_path/engine_path/rails_xxx"
```

5. 本地化 npm

```shell
npm link 
```

#### 第五步：在`RubyMine`或`VSCode`中开发

把本地项目文件夹和`engine`文件夹加入到您的编辑器中，您就可以愉快的开发了。我们更推荐使用`RubyMine`，它会自动索引代码，这样您就可以自如在项目代码和`engine`代码中跳转了。当然，您也可以使用免费且强大的`VSCode`，但需要您进行配置各类插件来达到`RubyMine`的功能。

### 总结

所有您需要查看源码的`Gem`，都可以采用这种方式。`git clone`到本地，`bundle config`设置到本地，加入编辑器 IDE，愉快的开发。

文档还在逐步完善中，如果您发现错误或者有更好的建议，欢迎您提`issue`或者和直接我们联系。
