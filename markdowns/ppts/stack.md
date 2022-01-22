---
theme: gaia
class:
 - lead
 - invert
paginate: true
marp: true
backgroundImage: url(../assets/bg.jpg)
---

# 全栈开发技术体系简介

覃明圆

---
# 基于 Rails

* 前沿
* 持续的生命力
* 开发哲学：影响使用者的思维方式
* 让使用者越来越轻松

---
# 高于 Rails

* 全栈
  * 纯 CSS：基于 Bulma(PC 端)， Weui(移动端，微信生态)
  * 基于 Stimulus 的 javascript 库

---
# 前沿
* 几乎所有语言都有模仿者（类 Rails 框架）
* 创造了很多概念：
  * ujs: unobtrusive javascript（非侵入式 JS 编码风格）
  * SJR: Server-generated JavaScript Responses
  * sending HTML instead of JSON
* 服务端：
  * 脚手架（生成代码）
  * 数据库迁移

---
# 持续的生命力

* 始于 2004 年
* 不仅没落伍，还一直走在前沿

---
# 开发哲学

## 让人受用的开发哲学
* DRY
* 主厨精选

---
# 对开发者的影响
## 在硅谷，Rails 风头正劲的时候，融资时估值直接翻倍

* 抓主要矛盾（Web 应用中的性能瓶颈在 IO，不在开发语言的执行效率）
* 兼容并包，平衡的艺术：技术选型不是非此即彼

---
# 让开发者越来越轻松
* 选择 Ruby：Ruby 是让开发者觉得快乐的语言
* 框架做更多

---
# 全栈

## 优点
* 相对于前后端分离：代码总量最少
  * 省去了重复性的前后端工作：路由，Model 定义
  * 直接传输 HTML 片段：后端导出 JSON，前端构造请求，将 JSON 转化为 Model, 基于 Vue 渲染 HTML。为何不直接将 HTML 片段发给浏览器。
  * HTML 片段比 JSON，自带排版
  * json 比 html 少的数据量，完全可以忽略不计。一个包有 576 字节。
* 减少前后端的沟通和协作成本

## 缺点
* 生态更好：基于 Vue 和 React 的 Design 库
* 市场环境：招聘、培训


---
# 基于 Rails 的 Work Design

* 业务层的
  * DRY
  * 主厨精选

---
# 业务层的积累可以减少 50% 以上的工程