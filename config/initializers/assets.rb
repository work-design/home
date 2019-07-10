Rails.configuration.assets.version = '1.0'

Rails.application.config.assets.paths += [
  Rails.root.join('node_modules'),
  *Dir[
    Rails.root.join('lib/nondigest_assets/*'),
    Rails.root.join('vendor/nondigest_assets/*')
  ]
]

#Sprockets.sync = 'qiniu'
