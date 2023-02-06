const dropdownToggles = document.querySelectorAll('.dropdown-toggle');
const dropdownMenus = document.querySelectorAll('.dropdown-menu');

dropdownToggles.forEach(function (dropdownToggle) {
  dropdownToggle.addEventListener('click', function () {
    const dropdownMenu = this.nextElementSibling;
    dropdownMenu.classList.add('show');
  });
});

document.addEventListener('click', function (event) {
  dropdownMenus.forEach(function (dropdownMenu) {
    if (!dropdownMenu.contains(event.target) && !dropdownMenu.previousElementSibling.contains(event.target) && dropdownMenu.classList.contains('show')) {
      dropdownMenu.classList.remove('show');
    }
  });
});