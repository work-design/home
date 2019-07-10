const getStyleRule = require('@rails/webpacker/package/utils/get_style_rule')

module.exports = getStyleRule(/\.(styl)$/i, false, [
  {
    loader: 'stylus-loader',
    options: {
      sourceMap: true, extractCSS: true
    }
  }
])
