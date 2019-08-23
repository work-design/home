const { environment } = require('@rails/webpacker')
const test = require('rails_com')

const expose = require('./loaders/expose')
environment.loaders.prepend('expose', expose)

const env = environment.toWebpackConfig()
env.entry = Object.assign(test.paths(), env.entry)
env.resolve.modules = env.resolve.modules.concat(test.resolved_roots)

module.exports = env
