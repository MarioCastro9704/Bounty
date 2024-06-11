// Modal para eliminar productos desde el index
document.addEventListener('turbo:load', function() {
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
