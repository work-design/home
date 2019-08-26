const { environment } = require('@rails/webpacker')
const paths = require('rails_com')

const jquery = require('rails_com/package/loaders/jquery')
const rails_ujs = require('rails_com/package/loaders/rails_ujs')
const moment = require('rails_com/package/loaders/moment')
const remote_js_load = require('rails_com/package/loaders/remote_js_load')

environment.loaders.append('jquery', jquery)
environment.loaders.append('rails_ujs', rails_ujs)
environment.loaders.append('moment', moment)
environment.loaders.append('remote_js_load', remote_js_load)

const env = environment.toWebpackConfig()
env.entry = Object.assign(paths(), env.entry)

module.exports = env
