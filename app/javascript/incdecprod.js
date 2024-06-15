document.addEventListener('turbo:load', () => {
  const maxQuantityElement = document.getElementById('max-quantity');
  if (!maxQuantityElement) return;

  const maxQuantity = parseInt(maxQuantityElement.value);

  document.querySelectorAll('[data-increment]').forEach(button => {
    button.removeEventListener('click', incrementHandler);
    button.addEventListener('click', incrementHandler);
  });

  document.querySelectorAll('[data-decrement]').forEach(button => {
    button.removeEventListener('click', decrementHandler);
    button.addEventListener('click', decrementHandler);
  });

  function incrementHandler(event) {
    const input = event.currentTarget.previousElementSibling;
    const currentValue = parseInt(input.value);

    if (currentValue < maxQuantity) {
      input.value = currentValue + 1;
    }
  }

  function decrementHandler(event) {
    const input = event.currentTarget.nextElementSibling;
    const currentValue = parseInt(input.value);

    if (currentValue > 1) {
      input.value = currentValue - 1;
    }
  }
});
