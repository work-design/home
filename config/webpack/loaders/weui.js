module.exports = {
  test: require.resolve('weui.js'),
  use: [
    {
      loader: 'expose-loader',
      options: 'weui'
    }
  ]
}
