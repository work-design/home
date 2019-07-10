RuCaptcha.configure do
  # Color style, default: :colorful, allows: [:colorful, :black_white]
  # self.style = :colorful
  # Custom captcha code expire time if you need, default: 2 minutes
  # self.expires_in = 120
  # [Requirement / 重要]
  # Store Captcha code where, this config more like Rails config.cache_store
  # default: Read config info from `Rails.application.config.cache_store`
  # But RuCaptcha requirements cache_store not in [:null_store, :memory_store, :file_store]
  # 默认：会从 Rails 配置的 cache_store 里面读取相同的配置信息，并尝试用可以运行的方式，用于存储验证码字符
  # 但如果是 [:null_store, :memory_store, :file_store] 之类的，你可以通过下面的配置项单独给 RuCaptcha 配置 cache_store
  self.cache_store = :mem_cache_store
end