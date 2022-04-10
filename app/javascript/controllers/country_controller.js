import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['form', 'infos']

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  selectCountry(event) {
    event.preventDefault();
    fetch(this.data.get("url"), {
      method: 'POST',
      body: JSON.stringify( { countries: [...event.target.selectedOptions].map(option => option.value)}),
      credentials: "include",
      dataType: 'script',
      headers: {
        "X-CSRF-Token": getMetaValue("csrf-token"),
        "Content-Type": "application/json"
      },
    })
      .then(response => response.text())
      .then(html => {
        this.infosTarget.innerHTML = html
      })
  }
}

function getMetaValue(name) {
  const element = document.head.querySelector(`meta[name="${name}"]`)
  return element.getAttribute("content")
}
