const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')
const sass = require('./loaders/sass')

environment.loaders.append('erb', erb)
environment.loaders.prepend('sass', sass)
module.exports = environment
