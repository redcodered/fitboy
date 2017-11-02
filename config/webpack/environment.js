const { environment } = require('@rails/webpacker')

environment.loaders.set('tsx', {
    test: /\.tsx?$/,
    use: 'awesome-typescript-loader',
    exclude: /node_modules/
})

module.exports = environment
