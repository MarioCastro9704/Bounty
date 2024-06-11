function updatePreview() {
  const model = document.getElementById("product_model")?.value || "";
  const productType = document.querySelector('input[name="product[product_type]"]:checked')?.value || "";
  const brand = document.getElementById("product_brand")?.value || "";
  const releaseDate = document.getElementById("product_release_date")?.value || "";
  const quantityAvailable = document.getElementById("product_quantity_available")?.value || "";
  const description = document.getElementById("product_description")?.value || "";
  const imageUrl = document.getElementById("product_image_url")?.value || "";
  const price = document.getElementById("product_price")?.value || "";

  document.getElementById("preview_model").textContent = model;
  document.getElementById("preview_product_type").textContent = productType;
  document.getElementById("preview_brand").textContent = `Marca: ${brand}`;
  document.getElementById("preview_quantity_available").textContent = `Stock: ${quantityAvailable}`;
  document.getElementById("preview_description").textContent = description;

  const previewImage = document.getElementById("preview_image");
  if (previewImage) {
    if (imageUrl) {
      previewImage.src = imageUrl;
      previewImage.style.display = "block";
    } else {
      previewImage.style.display = "none";
    }
  }

  const year = releaseDate ? new Date(releaseDate).getFullYear() : "N/A";
  document.getElementById("preview_release_date").textContent = `Año: ${year}`;
  document.getElementById("preview_price").textContent = price;

  const selectedSize = document.querySelector('input[name="product[size]"]:checked');
  document.getElementById("preview_size").textContent = selectedSize ? `Talla: ${selectedSize.value}` : "";
}
