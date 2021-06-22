## 远程使用

如果您已经熟悉 engine 的用法和提供的功能，不需要随时查看 engine 源代码，可以直接在`Gemfile`中添加远程的 github 代码库：

```yaml
gem 'rails_ui', github: "work-design/rails_ui"
```

然后 `bundle install`即可。
不过，`work design engine`业务抽象化组件集合了众多特性，随时查阅组件提供的功能和属性，然后根据您项目的实际需要进行定制和 override 重载是我们推荐的方式，所以我们更推荐您使用本地`submodule`的方式来进行开发。

## 本地`submodule`方式

我们更推荐的本地`submodule`方式，可以随时查看 engine 的文档、源码。

### 第一步：新建项目总文件夹

进入文件夹后，新建或拷贝已有的主项目。

### 第二步：克隆全部 engine 到本地项目总文件夹。

```shell
git clone https://github.com/work-design/rails_engine.git
```

### 第三步：进入到刚 clone 的 engine 目录中，初始化 engine

```shell
git submodule update --init
```

命令会根据`.gitmodules`这个文件中的配置`clone`所有 engine 到本地。如果您只是需要部分组件，也可以修改`.gitmodules`文件，只加入您项目需要的 rails_xxx。

```yaml
[submodule "rails_xxx"]
  path = rails_xxx
  url = git@github.com:work-design/rails_xxx.git
```

后续更新项目:

```shell
git pull
git submodule update --rebase(或--merge)
```

### 第四步：配置`bundle`

您也可以直接在`Gemfile`中直接指定 Gem 的路径为本地目录。

```yaml
gem 'rails_xxx", path:"~/your_gem_local_path"
```

但这种方式缺少灵活性，`Gemfile`带一大堆本地文件显得不专业 。

所以我们建议您使用`bundle config`命令来拦截`Gemfile`中的设置。每次`bundle install`时从本地文件获取`Gem`，而不是从远程网络中获取。您可以这样做：

```shell
bundle config local.rails_xxx ~/your_main_project_path/engine_path/rails_xxx
```

这个命令会修改`~/.bundle/config`文件，会在文件末尾添加：

```
BUNDLE_LOCAL__RAILS_XXX: "~/your_main_project_path/engine_path/rails_xxx"
```

#### 第五步：在`RubyMine`或`VSCode`中开发

把本地项目文件夹和`engine`文件夹加入到您的编辑器中，您就可以愉快的开发了。我们更推荐使用`RubyMine`，它会自动索引代码，这样您就可以自如在项目代码和`engine`代码中跳转了。当然，您也可以使用免费且强大的`VSCode`，但需要您进行配置各类插件来达到`RubyMine`的功能。

### 总结

所有您需要查看源码的`Gem`，都可以采用这种方式。`git clone`到本地，`bundle config`设置到本地，加入编辑器 IDE，愉快的开发。

文档还在逐步完善中，如果您发现错误或者有更好的建议，欢迎您提`issue`或者和直接我们联系。
