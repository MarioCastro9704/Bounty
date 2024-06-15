document.addEventListener("turbo:load", () => {
  const searchInput = document.getElementById("search-input");
  const resultsContainer = document.getElementById("autocomplete-results");

  if (searchInput) {
    searchInput.addEventListener("input", () => {
      const query = searchInput.value;

      if (query.length > 2) {
        fetch(`/products/autocomplete?query=${query}`, {
          headers: {
            'Accept': 'application/json'
          }
        })
        .then(response => response.json())
        .then(data => {
          resultsContainer.innerHTML = "";

          data.forEach(product => {
            const item = document.createElement("a");
            item.className = "list-group-item list-group-item-action";
            item.href = `/products/${product.id}`;
            item.style.display = "flex";
            item.style.alignItems = "center";
            item.style.padding = "10px";
            item.style.border = "1px solid #ddd";
            item.style.marginBottom = "5px";
            item.style.backgroundColor = "#fff";
            item.style.borderRadius = "5px";

            const img = document.createElement("img");
            img.src = product.image_url;
            img.alt = product.model;
            img.style.width = "50px";
            img.style.height = "50px";
            img.style.objectFit = "cover";
            img.style.marginRight = "15px";
            img.style.borderRadius = "5px";

            const textContainer = document.createElement("div");
            textContainer.style.flex = "1";

            const model = document.createElement("h5");
            model.innerText = product.model;
            model.style.margin = "0";
            model.style.fontSize = "1rem";

            const brand = document.createElement("p");
            brand.innerText = product.brand;
            brand.style.margin = "0";
            brand.style.color = "#666";
            brand.style.fontSize = "0.875rem";

            const price = document.createElement("small");
            price.innerText = `$${product.price}`;
            price.style.color = "#333";
            price.style.fontSize = "0.875rem";

            textContainer.appendChild(model);
            textContainer.appendChild(brand);
            textContainer.appendChild(price);

            item.appendChild(img);
            item.appendChild(textContainer);

            resultsContainer.appendChild(item);
          });
        })
        .catch(error => console.error('Error:', error));
      } else {
        resultsContainer.innerHTML = "";
      }
    });
  }
});
