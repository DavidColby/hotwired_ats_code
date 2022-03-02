import { Controller } from 'stimulus'
import Sortable from 'sortablejs'

export default class extends Controller {
  static targets = [ 'list' ]
  static values = {
    url: String,
    attribute: String
  }

  listTargetConnected() {
    this.listTargets.forEach(this.initializeSortable.bind(this))
  }

  initializeSortable(target) {
    new Sortable(target, {
      group: 'shared',
      animation: 100,
      sort: false,
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    const id = event.item.dataset.id
    const url = this.urlValue.replace(":id", id)
    const formData = new FormData()
    formData.append(this.attributeValue, event.to.dataset.newValue)
    window.mrujs.fetch(url, {
      method: 'PATCH',
      body: formData
    }).then(() => {}).catch((error) => console.error(error))
  }
}
