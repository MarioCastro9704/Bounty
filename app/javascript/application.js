// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// Modal para eliminar productos desde el index
document.addEventListener('DOMContentLoaded', function() {
  var confirmDeleteModal = document.getElementById('confirmDeleteModal');
  confirmDeleteModal.addEventListener('show.bs.modal', function(event) {
    var button = event.relatedTarget;
    var productId = button.getAttribute('data-product-id');
    var confirmDeleteForm = document.getElementById('confirmDeleteForm');
    confirmDeleteForm.setAttribute('action', '/products/' + productId);
  });

  var toastElList = [].slice.call(document.querySelectorAll('.toast'));
  var toastList = toastElList.map(function(toastEl) {
    return new bootstrap.Toast(toastEl, { delay: 10000 });
  });
  toastList.forEach(function(toast) { toast.show(); });
});
