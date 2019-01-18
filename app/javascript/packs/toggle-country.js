const continents = document.querySelectorAll('.continent-link');

continents.forEach(function (continent) {
  continent.addEventListener('click', function(e) {
    e.preventDefault();
    var query = `.${e.target.innerText.split(' ')[0]}`;
    const continentCountries = document.querySelectorAll(query);
    continentCountries.forEach(function (c) {
      c.classList.toggle('hidden');
    })
  })
})
