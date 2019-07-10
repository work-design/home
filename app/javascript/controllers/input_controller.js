import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'output' ];

  connect() {
    this.disable()
  }

  disable() {
    if (this.outputTarget.disabled === true) {
      disableClass(this)
    }
  }

  disableClass(input) {
    input.parentElement.parentElement.classList.add('weui-cell_disabled')
  }
}
