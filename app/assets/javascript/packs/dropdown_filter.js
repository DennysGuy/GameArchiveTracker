function initializeDropdownFilters() {
    document.addEventListener('DOMContentLoaded', function () {
      document.querySelectorAll('.dropdown').forEach(function (dropdown) {
        const button = dropdown.querySelector('.dropdown-button');
        const menu = dropdown.querySelector('.dropdown-menu');
        const items = dropdown.querySelectorAll('.dropdown-item');
        const filterDisplay = dropdown.querySelector('.filter-display');
  
        button.addEventListener('click', function () {
          menu.classList.toggle('hidden');
        });
  
        items.forEach(function (item) {
          item.addEventListener('click', function () {
            const filterValue = this.getAttribute('data-value');
            const filterUrl = dropdown.getAttribute('data-url');
  
            fetch(filterUrl, {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
              },
              body: JSON.stringify({ filter: filterValue })
            })
            .then(response => response.json())
            .then(data => {
              filterDisplay.textContent = data.filter_value;
              menu.classList.add('hidden');
              // Optionally, update other parts of the UI or re-fetch data based on the new filter
            })
            .catch(error => {
              console.error('Error:', error);
            });
          });
        });
      });
    });
  }
  
  // Initialize the dropdown filters
  initializeDropdownFilters();