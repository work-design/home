# Rails前端方案与前后端分离

Rails 一直以来给人们留下的是全栈框架的印象，Rails 程序员独自写完后端和前端。给大伙的感觉是 Rails 项目的分工比较协作比较困难，而分工协作在软件工程里属于很重要的部分，本文旨在对 Rails 风格的前后端分离工程实践做一个梳理。

## 全栈开发
在 Web 开发的早期，HTML 比较简单，那个时代的 Web 开发就等于是全栈开发。随着前端技术的蓬勃发展，特别是前端 MVC 框架的不断涌现，技术栈的复杂度提升，人们开始从软件工程角度实施前后端分离。

## 前后端分离
常规意义上的“前后端分离”更多是一种工程上的概念，主要具备以下特点：
* 前端和后端属于独立运行的两个应用(Application)；
* 前端和后端通过 API 接口传递数据；

“前后端分离”的意义主要有：
* 前端和后端的开发工作可以并行，彼此的进度不会相互阻塞；
* 由于前端和后端往往采用不同的语言和技术框架，程序员可以更专注于一个更小范围的技术领域。在 B/S 架构下的应用，前端只需专注于 Javascript，后端则使用 Ruby/PHP/Java(Spring框架) 等技术。

在 C/S(Client/Server) 架构下，Client 端属于“前端”，Server 端属于“后端”，本身就是前后端分离了。所以“前后端分离”主要是针对 B/S(Brower/Server) 架构的软件工程，即运行在浏览器里的 Web 应用。在没有“前后端分离”之前，传统的 Web 应用往往是由 Server 端生成能够在浏览器里运行的 HTML 代码，HTML 代码里亦包含了数据。

对于大型互联网企业而言，工程师往往只会负责某个小模块，前后端分离带来了工程和协作上的好处。

## 传统前后端分离的缺点
“前后端”分离固然带来了软件工程上的便利，同时也带来了新的成本和新的问题。

在传统的“前后端”一体化应用中，由 Server 端应用直接产生 HTML。采用“前后端分离”的方案后，后端输出 JSON（目前较普遍使用的方案）格式的数据，前端对 JSON 数据进行解析后再渲染出 HTML 页面。在这个过程中，有些在后端已经做过的事情，前端需要再做一遍，包括：

* 模型。前端往往不能直接将 JSON 数据转化为 HTML，需要先在 Javascript 中生成对应的 Model，然后由 Model 依据某些逻辑生成HTML，这部分 Model 往往被称为 View Model。比如 Vue 就会称自己为 MVVM 库，MVVM 即 Model-View-ViewMode。

* 路由层。“前后端分离”的前端项目，一般也被称为单页应用(SPA,Single Page Application)，单页应用免不了需要定义自己的路由，路由规则往往与Server端的路由重复。

毋容置疑，前后端分离带来了大量新增的工作量。虽然有一些优秀的前端框架的出现，如 Vue 等极大的方便了前端应用的开发。其实也正是这些前端框架的出现，才出现了“前后端分离”的流行。至于是先有蛋还是先有鸡，已经不重要了。

除了开发成本的增加。前后端分离还有一个巨大的痛点，即协作成本。前端开发者在实现某个页面的时候，往往会涉及到多个模型的数据，后端开发人员避免不了需要熟知页面的排版，并据此给出前端能满足其需求的数据。以笔者的经历，除了常规的 API 文档之外，与前端的直接沟通大都是后端 response 的数据不够满足前端页面的需求。

传统的前后端分离，通过 JSON 传输数据，JSON 的优点是格式简单，正因为简单，缺点也是显而易见，那就是表达力缺失。后端开发者如果直接返回 HTML 片段，可以有效的定义排版，由 CSS 完成视觉表达即可。

## Rails 的前后端分离探索
传统的后端渲染 HTML 的方案，生成的是完整的 Html 页面，然后发送到浏览器，这样的方案具有几个明显的缺点：
1. 传输的 HTML 文本大，不过现阶段带宽已不再成为瓶颈，这方面的影响可以忽略不计；
2. 整个 HTML 的渲染成本高，包含静态资源加载（缓存解决了大部分）；

为解决这个问题，Tubbolinks 应运而生，Turbolinks 采用 ajax 去获取后端的 HTML，然后进行body的替换。后来发展为 Turbo，Turbo 要求 js 代码的执行是幂等（多次运行，结果一样）的，很多 Rails 开发者的js代码总有点问题，对实际采用有所影响；

除了 Turbolinks 的解决思路，Rails 还祭出了一个大杀器，即[Server-generated JavaScript Responses (SJR)](https://signalvnoise.com/posts/3697-server-generated-javascript-responses)，通过 Rails UJS 实现了相关功能。实现方式如下：

1. 服务端向浏览器发送 js 代码片段，大部分情况，js 代码用于完成 dom 操作；
2. 浏览器接收到 js 代码片段，在 head 里新建一个 script 标签，将 js代码片段放到 script 标签内，js代码执行，[具体实现](https://github.com/rails/rails/blob/03516a924e71db7e065c8fb31c1d37af9b7c34ce/actionview/app/assets/javascripts/rails-ujs/utils/ajax.coffee#L69)；

SJR 的优点有：
1. 服务端只用像浏览器发送少量文本，即可实现丰富的逻辑；
2. 可以在 view 层复用 partial，节省了大量代码；
3. 足够灵活，对 js 的能力没有限制，同时通过 erb 可以自由使用 view 层的变量和方法；

SJR 在 Rails 圈子里风靡一时，被大面积使用。因为足够灵活，甚至一度被滥用了，大部分 js.erb 写得一点都不优雅。由此也暴露出了一些问题：
1. 写在 js.erb 中的代码由于大都与 View 层的变量绑定紧密，复用很难；
2. js.erb 中的js 代码需要考虑兼容性问题，随着下一代JS技术(Bable)的应用，js.erb 显得老态龙钟。为了可以用上 Bable, 笔者甚至为此写了个[小工具](https://github.com/work-design/rails_com/blob/master/lib/rails_com/utils/babel.rb)，不过确带来了新的问题，服务端的每个 Javasrcipt Response 都需要经过 Babel 处理，造成了极大的资源浪费。

说到底，js.erb 很难实现前端工程化。要实现前端工程化，最好的办法还是要让 HTML 与 js 代码“分离”，而不是通过 js.erb 加上 render partial 混在一起。

HTML 通过 js 来实现的一些效果，无非就是进行 Dom 操作，早期有 jQuery 这类 js库让程序员写 dom 操作不至于太痛苦，但是依然还是把一众前端开发者虐得生不如死。在这样的背景下，相继诞生了 Angular/React、Vue这些前端框架，这些库的核心也就是解决 dom 操作问题，通过标记符直接引用js 对象（model）,实现条件判断、循环这些常规操作，以及简化事件绑定。

不得不说，Vue 之流把前端程序员带到了新的境界。

无非就是简化 DOM 操作，为了解决同样的问题问题，Rails 生态有一套自己的办法，即：Stimulus，与 Vue、React 这类前端框架数据驱动视图的思路不同，Stimulus 的思路是在 js 与 HTML 之间建立连接。通过在HTML 中的 data 标记实现绑定事件，简化dom 操作，实现js 与 html 件的数据传输

Stimulus 在前端工程化上给我们指了条明路，而 js.erb 的优势，则需要另一套方案来继承，这就是 Turbo Stream，Turbo Stream 相当于是对 js.erb 进行了规范化使用，限制了 js.erb 的能力。其原理如下：

1. 服务端向浏览器发送 HTML 片段；
2. HTML 片段中指示该 HTML 片段应用的 target 和dom操作方式（prepend、append、replace、update、remove），个人觉得目前这5个 dom 操作不太够用，笔者又扩展了一个 after 操作；
3. 可通过 websocket 传输 html 片段，在某些场景下很实用，如服务端推送消息；

至此，Rails 前端实践经过多年闭关修炼，终于出关。正所谓大道至简，根据我的实践来看，采用 Hotwired(Turbo + Stimulus) 的前端实践代码量大概是 vue/react 等前后端分离方案的五分之一以下，或者更少。

## Vue 对于 Rails 开发者用不上了么？

Rails 前端方案相对于传统的单页应用(SPA) 是妥妥的降维打击，因为它几乎拥有单页应用的所有优势，而解决了单页应用的所有问题。

还是那句话：“没有银弹”，没有一种技术方案是全场景适用的，对于资源的 CURD，Rails 的 Turbo Stream 你就直接用就是。对于需要在页面上频繁进行数据操作的场景，如文本编辑器，则 Vue 是更容易发挥出其优势的。

作为小型的研发支持企业，我们要面对的场景是：如何让传统企业以最低的成本和最高的效率进行互联网+改造。从这个角度而言，全栈开发的优势就得以显现了。

## 更多阅读
* [前后端分裂](https://chloerei.com/2018/01/07/front-end-split)
* [用现代 Rails 逃离单页面应用 “兔子洞”](https://ruby-china.org/topics/37531)
* [Escaping the SPA rabbit hole with modern Rails](https://medium.com/@jmanrubia/escaping-the-spa-rabbit-hole-with-turbolinks-903f942bf52c)
