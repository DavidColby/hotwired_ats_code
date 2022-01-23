import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {
  static targets = ["start", "end"]

  connect() {
    flatpickr(this.startTarget)
    flatpickr(this.endTarget)
  }

  disconnect() {}
}
