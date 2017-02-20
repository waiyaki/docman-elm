const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

const HtmlWebpackPluginConfig = new HtmlWebpackPlugin({
  template: path.resolve(__dirname, 'src/index.html'),
  filename: 'index.html',
  inject: 'body'
});

const { NODE_ENV } = process.env;

const config = {
  devtool: 'inline-source-map',
  entry: ['./src/index.js'],
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, 'dist'),
    publicPath: '/'
  },
  module: {
    rules: [
      {
        test: /\.elm$/,
        include: [/src/],
        use: [
          {
            loader: 'elm-hot-loader'
          },
          {
            loader: 'elm-webpack-loader',
            options: {
              verbose: true,
              warn: true,
              debug: NODE_ENV !== 'production'
            }
          }]
      }
    ],
    noParse: /\.elm$/
  },
  plugins: [
    HtmlWebpackPluginConfig,
    new ExtractTextPlugin('styles.css')
  ],
  devServer: {
    stats: {
      colors: true,
      chunks: false
    }
  }
};

if (NODE_ENV === 'production') {
  config.devtool = false;
  config.module.rules = [
    {
      test: /\.css$/,
      use: ExtractTextPlugin.extract({
        fallback: 'style-loader',
        use: 'css-loader'
      })
    },
    ...config.module.rules
  ];
  config.plugins = [
    ...config.plugins,
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        screw_ie8: true,
        warnings: false
      },
      mangle: {
        screw_ie8: true
      },
      output: {
        comments: false,
        screw_ie8: true
      }
    }),
    new webpack.DefinePlugin({
      'process.env': { NODE_ENV: JSON.stringify('production') }
    })
  ];
} else {
  config.entry = [
    'webpack-dev-server/client?http://localhost:3001',
    ...config.entry
  ];
  config.module.rules = [
    {
      test: /\.css/,
      use: [
        'style-loader',
        'css-loader'
      ]
    },
    ...config.module.rules
  ];
  config.plugins = [
    ...config.plugins,
    new webpack.NamedModulesPlugin()
  ];
}

module.exports = config;
