# Adapted from:
# Addy Osmani, Andrew Dupont (http://addyosmani.com/blog/essential-js-namespacing/)

extend = (destination, source) ->
  toString = Object.prototype.toString
  objTest = toString.call {}
  for property in source
    if source[property] and (objTest == toString.call source[property])
      destination[property] = destination[property] or {}
      extend destination[property], source[property]
    else
      destination[property] = source[property]
  destination