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
            item.style.justifyContent = "space-between";
            item.style.padding = "10px";
            item.style.border = "1px solid #ddd";
            item.style.marginBottom = "5px";
            item.style.backgroundColor = "#fff";
            item.style.borderRadius = "5px";
            item.style.textDecoration = "none";
            item.style.color = "#333";

            const brand = document.createElement("span");
            brand.innerText = product.brand;
            brand.style.flex = "1";
            brand.style.marginRight = "10px";

            const model = document.createElement("span");
            model.innerText = product.model;
            model.style.flex = "2";
            model.style.marginRight = "10px";

            const price = document.createElement("span");
            price.innerText = `$${product.price}`;
            price.style.flex = "1";
            price.style.textAlign = "right";

            item.appendChild(brand);
            item.appendChild(model);
            item.appendChild(price);

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
