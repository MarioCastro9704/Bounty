document.addEventListener("turbo:load", function() {
  const productModel = document.getElementById("product_model");
  const productBrand = document.getElementById("product_brand");
  const productReleaseDate = document.getElementById("product_release_date");
  const productQuantityAvailable = document.getElementById("product_quantity_available");
  const productDescription = document.getElementById("product_description");
  const productImageUrl = document.getElementById("product_image_url");
  const productPrice = document.getElementById("product_price");
  const productCategorySelect = document.getElementById("product_category_id");

  if (productModel) productModel.addEventListener("input", updatePreview);
  if (productBrand) productBrand.addEventListener("input", updatePreview);
  if (productReleaseDate) productReleaseDate.addEventListener("input", updatePreview);
  if (productQuantityAvailable) productQuantityAvailable.addEventListener("input", updatePreview);
  if (productDescription) {
    productDescription.addEventListener("input", updateCharacterCount);
    productDescription.addEventListener("input", updatePreview);
  }
  if (productImageUrl) productImageUrl.addEventListener("input", updatePreview);
  if (productPrice) {
    productPrice.addEventListener("input", updatePreview);
    productPrice.addEventListener("input", () => formatPrice(productPrice));
  }

  if (productCategorySelect) {
    productCategorySelect.addEventListener("change", updateSizeOptions);
    productCategorySelect.addEventListener("change", updatePreview);
  }

  updateSizeOptions();
  updateCharacterCount();
  updatePreview();
});

function formatPrice(input) {
  // Eliminar los caracteres no numéricos excepto el punto decimal
  let value = input.value.replace(/[^0-9.]/g, '');

  // Dividir el valor en partes enteras y decimales
  let parts = value.split('.');

  // Limitar la parte decimal a dos dígitos
  if (parts.length > 1) {
    parts[1] = parts[1].slice(0, 2);
  }

  // Volver a unir las partes y asignar el valor formateado al input
  input.value = parts.join('.');
}

function updateSizeOptions() {
  const selectedCategory = document.getElementById("product_category_id")?.selectedOptions[0]?.text;
  const sizes = {
    'Ropa': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    'Zapatillas': ['6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12'],
    'Remeras': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    'Pantalones': ['28', '30', '32', '34', '36', '38', '40'],
    'Accesorios': ['Tamaño Único']
  };
  const selectedSizes = sizes[selectedCategory] || [];
  const sizeRadioButtons = document.getElementById("size_radio_buttons");

  if (sizeRadioButtons) {
    sizeRadioButtons.innerHTML = '';

    selectedSizes.forEach(size => {
      const input = document.createElement('input');
      input.type = 'radio';
      input.name = 'product[size]';
      input.id = `size_${size}`;
      input.value = size;
      input.classList.add('btn-check');
      input.onchange = updatePreview;
      sizeRadioButtons.appendChild(input);

      const label = document.createElement('label');
      label.htmlFor = `size_${size}`;
      label.classList.add('btn', 'btn-outline-primary', 'rounded-pill', 'mx-1');
      label.textContent = size;
      sizeRadioButtons.appendChild(label);
    });
  }
}

function updateCharacterCount() {
  const descriptionInput = document.getElementById("product_description");
  if (descriptionInput) {
    const maxLength = descriptionInput.getAttribute("maxlength");
    const currentLength = descriptionInput.value.length;
    const remaining = maxLength - currentLength;
    const counter = document.getElementById("description_counter");
    if (counter) {
      counter.textContent = `${remaining} caracteres restantes`;
    }
  }
}

function updatePreview() {
  const model = document.getElementById("product_model")?.value || "";
  const category = document.getElementById("product_category_id")?.selectedOptions[0]?.text || "";
  const brand = document.getElementById("product_brand")?.value || "";
  const releaseDate = document.getElementById("product_release_date")?.value || "";
  const quantityAvailable = document.getElementById("product_quantity_available")?.value || "";
  const description = document.getElementById("product_description")?.value || "";
  const price = document.getElementById("product_price")?.value || "";

  document.getElementById("preview_model").textContent = model;
  document.getElementById("preview_category").textContent = category;
  document.getElementById("preview_brand").textContent = `Marca: ${brand}`;
  document.getElementById("preview_quantity_available").textContent = `Stock: ${quantityAvailable}`;
  document.getElementById("preview_description").textContent = description;

  const year = releaseDate ? new Date(releaseDate).getFullYear() : "N/A";
  document.getElementById("preview_release_date").textContent = `Año: ${year}`;
  document.getElementById("preview_price").textContent = price;

  const selectedSize = document.querySelector('input[name="product[size]"]:checked');
  document.getElementById("preview_size").textContent = selectedSize ? `Talla: ${selectedSize.value}` : "";
}
