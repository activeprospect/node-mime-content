

parse = (content) ->
  json = JSON.parse(content)

  json.toString = ->
    content

  json

module.exports = parse