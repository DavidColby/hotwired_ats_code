import ApplicationController from './application_controller'
import Tribute from 'tributejs'
import Trix from 'trix'

export default class extends ApplicationController {
  static values = {
    userList: { type: Array, default: [] },
  }

  connect() {
    super.connect()
    this.editor = this.element.editor
    this.initializeTribute()
    this.stimulate("Mentions#user_list")
  }

  initializeTribute() {
    this.tribute = new Tribute({
      allowSpaces: true,
      lookup: 'name',
      values: [],
      noMatchTemplate: function () { return 'No matches!'; },
    })
    this.tribute.attach(this.element)
    this.element.addEventListener('tribute-replaced', this.replaced.bind(this))
    this.tribute.range.pasteHtml = this._pasteHtml.bind(this)
    this.userListValueChanged.bind(this)
  }

  userListValueChanged() {
    if (this.userListValue.length > 0 && this.tribute !== undefined) {
      this.tribute.append(0, this.userListValue)
    }
  }

  // afterUserList() {
  //   this.tribute.append(0, this.userListValue)
  // }

  disconnect() {
    this.tribute.detach(this.element)
  }

  replaced(e) {
    let mention = e.detail.item.original
    let attachment = new Trix.Attachment({
      content: this.mentionContent(mention.name),
      sgid: mention.sgid,
    })
    this.editor.insertAttachment(attachment)
    this.editor.insertString(" ")
  }

  mentionContent(name) {
    return "<span class=\"text-blue-500\">@" + name + "</span>"
  }

  _pasteHtml(html, startPos, endPos) {
    let range = this.editor.getSelectedRange()
    let position = range[0]
    let length = endPos - startPos

    this.editor.setSelectedRange([position - length, position])
    this.editor.deleteInDirection("backward")
  }
}
