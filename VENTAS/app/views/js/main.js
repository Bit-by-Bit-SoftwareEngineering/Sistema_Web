/*Mostrar ocultar menu principal*/
let btn_menu=document.getElementById('btn-menu');
btn_menu.addEventListener("click", function(e){
    e.preventDefault();

    let navLateral=document.getElementById('navLateral');
    let pageContent=document.getElementById('pageContent');

    if(navLateral.classList.contains('navLateral-change') && pageContent.classList.contains('pageContent-change')){
        navLateral.classList.remove('navLateral-change');
        pageContent.classList.remove('pageContent-change');
    }else{
        navLateral.classList.add('navLateral-change');
        pageContent.classList.add('pageContent-change');
    }
});

/*Mostrar y ocultar submenus*/
let btn_subMenu=document.querySelectorAll(".btn-subMenu");
btn_subMenu.forEach(subMenu => {
    subMenu.addEventListener("click", function(e){

        e.preventDefault();
        if(this.classList.contains('btn-subMenu-show')){
            this.classList.remove('btn-subMenu-show');
        }else{
            this.classList.add('btn-subMenu-show');
        }
    });
});


document.addEventListener('DOMContentLoaded', () => {
  // Functions to open and close a modal
  function openModal($el) {
    $el.classList.add('is-active');
  }

  function closeModal($el) {
    $el.classList.remove('is-active');
  }

  function closeAllModals() {
    (document.querySelectorAll('.modal') || []).forEach(($modal) => {
      closeModal($modal);
    });
  }

  // Add a click event on buttons to open a specific modal
  (document.querySelectorAll('.js-modal-trigger') || []).forEach(($trigger) => {
    const modal = $trigger.dataset.target;
    const $target = document.getElementById(modal);

    $trigger.addEventListener('click', () => {
      openModal($target);
    });
  });

  // Add a click event on various child elements to close the parent modal
  (document.querySelectorAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button') || []).forEach(($close) => {
    const $target = $close.closest('.modal');

    $close.addEventListener('click', () => {
      closeModal($target);
    });
  });

  // Add a keyboard event to close all modals
  document.addEventListener('keydown', (event) => {
    if (event.code === 'Escape') {
      closeAllModals();
    }
  });
});

document.addEventListener('DOMContentLoaded', () => {
  // Función para cargar la página con AJAX
  function loadPage(url) {
      console.log("Cargando página desde:", url);
      const xhr = new XMLHttpRequest();
      xhr.open('GET', url, true);
      xhr.onload = function () {
          if (this.status === 200) {
              const parser = new DOMParser();
              const doc = parser.parseFromString(this.responseText, 'text/html');

              // Encuentra el contenedor principal actualizado de la respuesta
              const currentContainer = document.querySelector('.container.pb-6.pt-6'); // Clase del contenedor de productos
              const newContent = doc.querySelector('.container.pb-6.pt-6'); // Nueva clase en la página cargada

              if (newContent && currentContainer) {
                  // Reemplaza el contenido del contenedor actual con el nuevo contenido
                  currentContainer.innerHTML = newContent.innerHTML;
              } else {
                  console.error("Contenedor principal no encontrado en la respuesta o en la página actual.");
              }

              // Actualizar paginación si está presente
              const currentPagination = document.querySelector('.pagination');
              const newPagination = doc.querySelector('.pagination');
              if (newPagination && currentPagination) {
                  currentPagination.innerHTML = newPagination.innerHTML;
              }
          } else {
              console.error("Error al cargar la página:", this.status);
          }
      };
      xhr.send();
  }

  // Añadir eventos a los enlaces de paginación
  document.addEventListener('click', function (e) {
      if (e.target.matches('.pagination a')) {
          e.preventDefault();
          const url = e.target.getAttribute('href'); // Usamos el href directamente para soportar diferentes estructuras de URL
          if (url) {
              loadPage(url);
          } else {
              console.error("URL no encontrada en el enlace de paginación.");
          }
      }
  });
});

// Function to add item to cart
function addToCart(productId) {
  let cart = JSON.parse(localStorage.getItem('cart')) || [];
  cart.push(productId);
  localStorage.setItem('cart', JSON.stringify(cart));
  updateCartCount();
}

// Function to update cart count
function updateCartCount() {
  let cart = JSON.parse(localStorage.getItem('cart')) || [];
  document.getElementById('cart-count').innerText = cart.length;
}

// Call updateCartCount on page load to maintain cart count
document.addEventListener('DOMContentLoaded', updateCartCount);

document.addEventListener('DOMContentLoaded', function() {
  updateCartCount();
  loadCartItems();
});

function loadCartItems() {
  let cart = JSON.parse(localStorage.getItem('cart')) || [];
  // Logic to display cart items on the page
  // For example, you can loop through the cart array and display each item
  cart.forEach(productId => {
      // Add code to display each product in the cart
  });
}