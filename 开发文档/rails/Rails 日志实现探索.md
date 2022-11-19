# Rails日志实现探索

我一直很好奇在Rails中，日志是如何记录一个Rails App运行的信息的。我查看了一下Rails的中间件，发现了`Rails::Rack::Logger`

```shell
# rake middleware
...
use Rack::MethodOverride
use Rails::Rack::Logger
use ActionDispatch::ShowExceptions
...
```

查看`Rails::Rack::Logger`中实现记录日志的主要代码，发现了两个奇怪的类：`ActiveSupport::Notifications`和`ActiveSupport::LogSubscriber`

```ruby
def call_app(request, env)
  # ...
  instrumenter = ActiveSupport::Notifications.instrumenter
  instrumenter.start 'request.action_dispatch', request: request
  logger.info { started_request_message(request) }
  resp = @app.call(env)
  resp[2] = ::Rack::BodyProxy.new(resp[2]) { finish(request) }
  resp
rescue Exception
  finish(request)
  raise
ensure
  ActiveSupport::LogSubscriber.flush_all!
end
```

### 日志功能实现

Rails中对日志的处理采用的是“消息-订阅”机制，各部分组件和功能如下：

* 消息发送：`ActiveSupport::Notifications`
  - `instrument`: 通知subscribers


* 消息订阅：`ActiveSupport::LogSubscriber`


## 日志功能实现

Rails中对日志的处理采用的是“消息-订阅”机制，各部分组件和功能如下：

### 日志消息的发送：`ActiveSupport::Notifications`

- `instrument`： 通知所有的 subscribers

扩展：可在通知前先执行一个代码块；

```ruby
ActiveSupport::Notifications.instrument('render', extra: :information) do
  render text: 'Foo'
end
```

* `ActiveSupport::Notifications::Instrumenter`: 下发通知的组织

* `ActiveSupport::Notifications::Fanout`: 下发通知的执行人

## 工作流程

### 安排下发通知的人

```ruby
# 1、每个事件分配一个执行人员（员工）
ActiveSupport::Notifications.notifier = ActiveSupport::Notifications::Fanout.new

# 2、不能瞎指派员工，指派的员工须得有这个能力
if notifier.listening?(name)
  instrumenter.instrument(name, payload) { yield payload if block_given? }
end

# 3、通过员工的上级领导（cto）分配工作
def instrumenter
  InstrumentationRegistry.instance.instrumenter_for(notifier)
end
```

### 具体工作

1、`Instrumenter`安排工作

```ruby
# Send a start notification with +name+ and +payload+.
def start(name, payload)
  @notifier.start name, @id, payload
end

# Send a finish notification with +name+ and +payload+.
def finish(name, payload)
  @notifier.finish name, @id, payload
end
```

2、`Fanout` 接受任务开始干活

```ruby
def start(name, id, payload)
  listeners_for(name).each { |s| s.start(name, id, payload) }
end

def finish(name, id, payload)
  listeners_for(name).each { |s| s.finish(name, id, payload) }
end

def publish(name, *args)
  listeners_for(name).each { |s| s.publish(name, *args) }

  # s 为`ActiveSupport::Notifications::Fanout::Subscribers::Evented`实例
end
```
干活的人多了个`publish`方法，反馈任务（员工需要汇报工作）

3、`ActiveSupport::Notifications::Fanout::Subscribers::Evented` 具体的任务

```ruby
def publish(name, *args)
  if @can_publish
    @delegate.publish name, *args
  end
end

def start(name, id, payload)
  @delegate.start name, id, payload
end

def finish(name, id, payload)
  @delegate.finish name, id, payload
end
```
`delegate` 这个又是谁呢？

## 答案揭晓

其实这个员工他也不干活，他将工作外包出去了！！！

## 订阅者（接外包）的实现

### `ActiveSupport::Subscriber` 负责干活的订阅者

```ruby
def start(name, id, payload)
  e = ActiveSupport::Notifications::Event.new(name, Time.now, nil, id, payload)
  parent = event_stack.last
  parent << e if parent

  event_stack.push e
end

def finish(name, id, payload)
  finished  = Time.now
  event     = event_stack.pop
  event.end = finished
  event.payload.merge!(payload)

  method = name.split('.').first
  send(method, event)
end
```

## `ActiveSupport::LogSubscriber < ActiveSupport::Subscriber`

```ruby
def start(name, id, payload)
  super if logger
end

def finish(name, id, payload)
  super if logger
rescue Exception => e
  logger.error "Could not log #{name.inspect} event. #{e.class}: #{e.message} #{e.backtrace}"
end
```

这里的 logger 实际是 Rails.logger

## 
