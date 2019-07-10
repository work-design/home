// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

DOMStringMap.prototype.add_controller = function(controller_name) {
  if (typeof this.controller === 'string' && this.controller.length > 0) {
    this.controller = this.controller.concat(' ').concat(controller_name)
  } else {
    this.controller = controller_name
  }
}

window.application = Application.start()
const context = require.context('controllers', true, /_controller\.js$/)
window.application.load(definitionsFromContext(context))
