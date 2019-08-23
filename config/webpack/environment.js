const { environment } = require('@rails/webpacker')
const test = require('rails_com')

const jquery = require('rails_com/package/loaders/jquery')
const rails_ujs = require('rails_com/package/loaders/rails_ujs')

environment.loaders.prepend('jquery', jquery)
environment.loaders.prepend('rails_ujs', rails_ujs)

const env = environment.toWebpackConfig()
env.entry = Object.assign(test.paths(), env.entry)
env.resolve.modules = env.resolve.modules.concat(test.resolved_roots)

module.exports = env
