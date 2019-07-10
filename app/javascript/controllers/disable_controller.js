import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'output' ];

  connect() {
    this.disable()
  }

  disable() {
    let input = this.outputTarget;
    input.disabled = true;
    input.parentElement.parentElement.classList.add('weui-cell_disabled')
  }
}
