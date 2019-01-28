const cardLinks = document.querySelectorAll('.card-link');

cardLinks.forEach(function (link) {
  link.addEventListener('click', function(e) {
    e.preventDefault();
    e.path[2].children[1].classList.toggle('hidden');
  })
})
