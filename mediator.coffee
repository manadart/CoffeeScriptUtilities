# Adapted from:
# Addy Osmani (http://addyosmani.com/largescalejavascript/)
# HB Stone (http://arguments.callee.info/2009/05/18/javascript-design-patterns--mediator/)

mediator = do -> 
  subscribe = (channel, fn) ->
    mediator.channels[channel] = [] unless mediator.channels[channel]
    mediator.channels[channel].push
      context: this
      callback: fn
  
  unsuscribe = (channel) ->
    delete mediator.channels[channel] if channel in mediator.channels

  publish = (channel) ->
    return false unless mediator.channels[channel]
    args = Array.prototype.slice.call arguments, 1
    subscription.callback.apply subscription.context, args for suscription in mediator.channels[channel]
    this

  return {
    channels: {}
    subscribe: subscribe
    unsubscribe: unsubscribe
    publish: publish
    installTo: (obj) ->
      obj.subscribe = subscribe
      obj.publish = publish
  }