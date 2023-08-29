// app/javascript/controllers/post_form_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["title", "content", "image"];

  submitForm(event) {
    event.preventDefault();
    const formData = new FormData();
    formData.append("title", this.titleTarget.value);
    formData.append("content", this.contentTarget.value);
    formData.append("image", this.imageTarget.files[0]);
    formData.append("user_id", this.data.get("userId"));

    fetch(this.data.get("action"), {
      method: "POST",
      body: formData
    }).then(response => {
      // Handle response as needed
    });
  }
}
