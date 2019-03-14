const path = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

const extractPortalCss = new ExtractTextPlugin('./portal.css');
const extractBuilderCss = new ExtractTextPlugin('./builder.css');

const externalLibs = {
    'react': 'React',    
    'react-dom': 'ReactDOM',
    'immutable': 'Immutable',
    'redux': 'Redux',
    'react-redux': 'ReactRedux',
    'moment': 'moment',
    'axios': 'axios',
    'node-uuid': 'uuid',
    'redux-thunk': 'ReduxThunk',
    'react-transition-group': 'ReactTransitionGroup'
};

const resolve = {
    extensions: ['.ts', '.tsx', '.js', '.scss']
};

const compileRules = [
    {
        test: /\.tsx?$/, 
        loader: 'ts-loader'
    },
    {
        test: /\.scss$/, 
        include: [
            path.resolve(__dirname, 'src/framework/css')
        ],
        loader: extractPortalCss.extract({
            use: [{
                loader: 'css-loader'
            }, {
                loader: 'sass-loader'
            }],
            fallback: 'style-loader'
        })
    },
    {
        test: /\.scss$/, 
        include: [
            path.resolve(__dirname, 'src/builder/css')
        ],
        loader: extractBuilderCss.extract({
            use: [{
                loader: 'css-loader'
            }, {
                loader: 'sass-loader'
            }],
            fallback: 'style-loader'
        })
    },
    {
        test: /\.(png|jpg|svg)$/, 
        loader: 'url-loader'
    },
    { 
        test: /\.js$/, 
        enforce: "pre",
        loader: 'source-map-loader',
        exclude: [/node_modules/] 
    }
];

const devConfig = {
    entry: {
        portal: './src/portal.tsx',
    },
    output: {
        filename: '[name].dev.js',
        path: path.resolve(__dirname, 'dist')
    },
    externals: externalLibs,
    devtool: 'source-map',
    resolve: resolve,
    module: {
        rules: compileRules
    },
    plugins: [
        extractPortalCss,
        extractBuilderCss
    ]
};


// module.exports = [devConfig, prodConfig];
module.exports = devConfig;
// module.exports = prodConfig;