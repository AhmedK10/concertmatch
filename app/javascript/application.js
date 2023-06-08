// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="modal"]').modal();
});
