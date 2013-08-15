xpath = require 'xpath'
xmldom = require 'xmldom'

attribute = /@[a-z0-9]+$/i
text = /text\(\)$/

select = (selector, nodes) ->
  nodes.map (node) ->
    if selector.match(attribute)
      node.value
    else if selector.match(text)
      node.data
    else
      node

parse = (content) ->
  doc = new xmldom.DOMParser().parseFromString(content)

  # Content can be queried using XPath
  queryable = (selector, multi) ->
    nodes = xpath.select(selector, doc, false)
    multi = if typeof multi == 'boolean' then multi else false
    if !multi && nodes.length > 1
      nodes = [nodes[0]]
    selected = select(selector, nodes)
    if !multi then selected[0] else selected

  # Content can be coerced to a string
  queryable.toString = ->
    content

  queryable

module.exports = parse