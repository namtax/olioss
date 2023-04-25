import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  like(event) {
    event.preventDefault();
    const updateUrl = this.data.get("update-url");
    const csrfToken = document.head.querySelector('meta[name="csrf-token"]').content;

    fetch(updateUrl, {
      method: 'PATCH',
      credentials: "include",
      headers: {
        "X-CSRF-Token": csrfToken
      },
    }).then(function(response) {
      if (response.status === 200) {
        return response.json();
      } 
    }).then(function(data) {
      event.target.parentElement.getElementsByClassName("likes")[0].textContent = data.likes;
    }).catch(function(error) {
      console.error(error);
    });
  }
}

