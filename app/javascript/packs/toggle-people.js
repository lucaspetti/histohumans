const cardLinks = document.querySelectorAll('.card-link');

cardLinks.forEach(function (link) {
  link.addEventListener('click', function(e) {
    e.preventDefault();
    // e.path[1].children[3].classList.toggle('hidden');
    console.log(e.path);
    console.log(e.path.nextElementSibling);
  })
})
