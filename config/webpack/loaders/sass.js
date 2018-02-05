module.exports = {
    test: /\.(css|scss|sass)$/,
    use: [{
        loader: 'style-loader'
    }, {
        loader: 'css-loader'
    }, {
        loader: 'sass-loader',
        options: {
            includePaths: ['node_modules'],
        }
    }]
}
