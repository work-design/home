const webpack = require('webpack')
const { environment } = require('@rails/webpacker')
const test = require('rails_com')
const env = environment.toWebpackConfig()
env.entry = Object.assign(test.paths(), env.entry)
env.resolve.modules = env.resolve.modules.concat(test.roots)
env.plugins.unshift(
  new webpack.ProvidePlugin({
    $: 'jquery'
  })
)

module.exports = env
