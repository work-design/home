/* eslint no-console:0 */

import { Application, Controller } from 'stimulus'

debugger

class HelloController extends Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  connect() {
    console.log("Connect, Stimulus!", this.element)
  }
}
const application = Application.start()
application.register('attachment', HelloController)