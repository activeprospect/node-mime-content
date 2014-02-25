qs = require 'querystring'

parse = (content) ->
  qs.parse(content)

module.exports = parse
