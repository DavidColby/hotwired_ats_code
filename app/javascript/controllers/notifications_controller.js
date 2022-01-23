import ApplicationController from './application_controller'

export default class extends ApplicationController {
  connect () {
    super.connect()
  }

  read() {
    this.stimulate("Notifications#read", this.element)
  }

  beforeRead(element) {
    element.classList.add("opacity-0")
    setTimeout(() => {
      element.remove()
    }, 150);
  }
}
