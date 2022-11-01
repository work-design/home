# Ruby & Rails代码风格

参考：[社区版本Ruby Style][1]

主要是做一些团队内的补充；

## Ruby

* 在字符串中尽可能使用单引号：`'string'`：
- 相对于双引号`"String"`，性能更好，虽然提升的量很小；
  - 输入单引号的时候，不需要使用Shift + `'"`组合按键，输入速度更快，引号是一个特别特别频繁的使用，就算每次数毫秒的速度提升也能大大提高整体效率；

* 代码排版方式倾向于：

```ruby
def send_mail(source)
  Mailer.deliver(
    to: 'bob@example.com',
    from: 'us@example.com',
    subject: 'Important message',
    body: source.text
  )
end
```
  1. 调整被call的方法名更灵活，假设我们需要将 deliver 方法更名，不需要再调整排版。
  2. 调整参数更灵活，不必要因为增加或者减少参数，重新排版；

## Rails

### 模型定义

* 推荐代码顺序如下：
  - `attribute`
  - `enum`
  - `belongs_to`
  - `has_one/has_many`
  - `scope`
  - `validate`
  - `callbacks`


* 定义Enum时尽量使用hash, 避免使用Array（Integer）,理由：
  * 灵活性更强，我们先看一个使用Array的例子；
```ruby
enum state: ['init', 'done']
```
  这个例子在数据库中，'init'对应值为0， 'done'对应值为1。如果咱们需要增加一种中间状态：
```ruby
enum state: ['init', 'doing', 'done']
```
  就不太好处理，如果把'doing'放在最后面，不符合业务逻辑，如果放在中间，需要迁移数据，推荐的方式是：
```ruby
enum state: {
  init: 'init',
  done: 'done'
}
```
  这样在拓展的时候就方便得多。

  2. 避免魔法数字，如果直接查询数据的时候，对于存在于数据库中的数字0，1等，不能直观的知道其意义，需要参考代码中的定义。

[1]:	https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md