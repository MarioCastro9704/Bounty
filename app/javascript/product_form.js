document.addEventListener("DOMContentLoaded", function() {
  const productForm = document.getElementById("product_form");
  if (!productForm) {
    return;
  }

  const previewImage = document.getElementById("preview_image");
  const previewModel = document.getElementById("preview_model");
  const previewReleaseDate = document.getElementById("preview_release_date");
  const previewBrand = document.getElementById("preview_brand");
  const previewQuantityAvailable = document.getElementById("preview_quantity_available");
  const previewDescription = document.getElementById("preview_description");
  const productTypeSelect = document.querySelectorAll('input[name="product[product_type]"]');
  const sizeRadioButtons = document.getElementById('size_radio_buttons');

  const sizes = {
    'Ropa': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    'Zapatillas': ['6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12']
  };

  function updateSizeOptions() {
    const selectedType = document.querySelector('input[name="product[product_type]"]:checked');
    if (!selectedType) return;

    const sizeOptions = sizes[selectedType.value] || [];

    sizeRadioButtons.innerHTML = '';
    sizeOptions.forEach(function(size) {
      const input = document.createElement('input');
      input.type = 'radio';
      input.className = 'btn-check';
      input.name = 'product[size]';
      input.id = size;
      input.value = size;
      input.autocomplete = 'off';

      const label = document.createElement('label');
      label.className = 'btn btn-outline-primary rounded-pill mx-1';
      label.htmlFor = size;
      label.textContent = size;

      sizeRadioButtons.appendChild(input);
      sizeRadioButtons.appendChild(label);
    });
  }

  function updatePreview() {
    previewModel.textContent = document.getElementById("product_model").value;
    previewReleaseDate.textContent = "Fecha: " + document.getElementById("product_release_date").value;
    previewBrand.textContent = "Ubicación: " + document.getElementById("product_brand").value;
    previewQuantityAvailable.textContent = "Cantidad Disponible: " + document.getElementById("product_quantity_available").value;
    previewDescription.textContent = document.getElementById("product_description").value;

    const imageUrl = document.getElementById("product_image_url").value;
    if (imageUrl) {
      previewImage.src = imageUrl;
      previewImage.style.display = "block";
    } else {
      previewImage.style.display = "none";
    }
  }

  // Initialize the preview and size options on page load
  updatePreview();
  updateSizeOptions();

  productForm.addEventListener("input", updatePreview);
  productTypeSelect.forEach(button => button.addEventListener('change', updateSizeOptions));
});
