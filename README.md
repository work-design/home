# Work Design

Work Design 是基于一套快速开发体系发展而来，融合了技术治理、产品、运营思路、商业模式的整套体系。

Work Design 是业务组件化的先驱，在业务复杂多变的情况下达到了平衡。旨在打造一个开发成本低，维护简单，扩展灵活的应用框架，支持微信等多端。

包含：
* [Work Design 技术体系](#Work-Design-技术体系)
 * [更多](stack)
* [Work Design 应用](#Work-Design-应用)
 * [更多](project)
* [Work Design 团队治理](#Work-Design-团队治理)
 * [更多](handbook)

## Work Design 技术体系

Work Design 的技术体系是一套追求低成本开发，高效率产出的软件方案。由以下几部分组成：

* 软件快速开发体系：
  * 基于公认效率最高的 Web 全栈开发框架：[Ruby On Rails](https://github.com/rails/rails) ，相对常规 Rails 开发提升 2~3 倍效率（基于代码总量判断）；
  * 业务组件化，通用常用功能组件化，开箱即用，进一步提升 5 ~ 10 倍开发效率；
* 追求效率的 IT 团队管理方案：
  * 打破传统的 产品 -> 设计 -> 开发 -> 测试 的实施流程，避免各岗位工作阻塞，尽可能减少各个环节传递过程中的沟通成本和损耗；
  * 更加体系化的管理，从产品原型、设计、开发都是遵循组件化的策略进行架构；

### 架构理念
* 最佳实践
* 灵活，易于扩展，Override
* [减少重复工作造成的浪费]
* [全链条]
* [约定优于配置](default.md)
* [工具优于约定](tools.md)
* [前后端“分离”](full_stack_vs_separate.md)

### 原理
* [降低数字化成本，实现技术普惠](why_build_self.md)
* [工具](tools.md)：优化工具，提升生产力，除了通用的功能及组件，我们也对一些工具进行了优化，比如表单构建工具。
* [模块化](modular.md)：我们将通用的功能进行了抽取，以 Rails Engine 的形式附加到主项目即可快速应用某块功能；
* [体系化]：基于统一的设计理念，UI体系，一致性。
* [语言是生产力](function-vs-object.md)

### 技术原则
技术架构和选型遵循以下原则：
* 尽可能减少技术栈，比如我们并没有引入诸如Vue, React这类的前端框架，而只是采用了基本的HTML、CSS、Javascript；
* 尽可能通用的方案，但是可以override的能力；通用的方案让你先玩起来，override 的能力助你成为专业玩家；
* 尽可能对开发者友好，降低入门门槛；
* 尽可能完善且系统化的文档；

## Work Design 应用
基于 Work Design 的技术体系和组件，我们搭建了 https://work.design 这个应用。这个项目的使命如下：
* 基于业务组件进行“搭积木”式快速开发的实践和演示；
* 为 Work Design 的生态服务；

## Work Design 团队治理

## 关于开源
为了让知识和技术惠及更多人，我们采取了毫无保留的开源策略，以免除使用者的后顾之忧。

## 加入我们
如果你是：
* 自由职业者
* 中小企业主，中小企业 IT 负责人；

Work Design 的生态正是为解决你的问题而生，Web 应用的开发是一个庞大且复杂的技术体系，Work Design 将前沿的技术体系化繁为简，让你可以循序渐进的基于我们的开源组件进行开发。

同时我们也提供了完善的培训计划（即将到来）。


## 相关项目
* [engine](https://github.com/work-design/engine)：Rails Engine 汇总

## 基于 Work Design 发展的项目
* [Work Design](https://github.com/work-design/work.design)：定位于服务小微型企业，为自由职业者提供平台，基于 Work Design 技术栈孵化的开源项目，旨在打造下一代企业管理系统
* [有个想法](https://github.com/yougexiangfa)：基于 Work Design 技术栈孵化的技术服务公司

如果你希望基于 Work Design 提供的组件来打造属于自己的公司和项目，亦或者是成为自由职业者，尽请提交 [issue](https://github.com/work-design/home/issues)，我们会将你加入到这个列表当中。

## 联系我
![](assets/wechat.jpg)