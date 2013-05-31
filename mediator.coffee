
mediator = do ->
  
  subscribe = (channel, fn) ->
    mediator.channels[channel] = [] unless mediator.channels[channel]
    mediator.channels[channel].push
      context: this
      callback: fn
  
  publish = (channel) ->
    return false unless mediator.channels[channel]
    args = Array.prototype.slice.call arguments, 1
    subscription.callback.apply subscription.context, args for suscription in mediator.channels[channel]
    this

  return {
    channels: {}
    subscribe: subscribe
    publish: publish
    installTo: (obj) ->
      obj.subscribe = subscribe
      obj.publish = publish
  }