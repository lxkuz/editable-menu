window.initialize = (el = document) ->
  func? el for key, func of window.initializers

$ ->
  initialize()

window.addComponent = (klass, options) ->
  throw "Undefined role name of component #{klass.toString().match(/function (\w+)\(.*/)[1]}" unless options.name
  roleName = options.name + "-role"
  doneRoleName = "#{options.name}-role-done"
  window.initializers ||= {}
  window.initializers[roleName] = (el)->
    targets = $ "[#{roleName}]", el
    targets.each (i, target)->
      item = undefined
      if options.view
        # in case of initialize backbone views
        item = new klass {el: target}
      else
        item = new klass target
      $(target).removeAttr(roleName).attr doneRoleName, true
      options.handler?(item)