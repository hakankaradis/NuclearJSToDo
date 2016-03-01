module.exports = {
  entry: [
    './src/index.coffee'
  ],
  output: {
    path: __dirname,
    publicPath: '/',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
    {
      exclude: /node_modules/,
      loader: 'babel'
    },
    {
      test: /\.coffee$/,
      loaders: ["coffee",   "cjsx-loader"]
    },
    {
      test: /\.css$/, loader: "style-loader!css-loader"
    },
    {
      test: /\.(coffee\.md|litcoffee)$/,
      loader: "coffee-loader?literate"
    }]
  },
  resolve: {
    extensions: ['', '.js', '.jsx', '.coffee']
  },
  devServer: {
    contentBase: './'
  }
};
