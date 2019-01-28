const continents = document.querySelectorAll('.continent-link');
const countriesList = document.querySelector('.countries-list');

continents.forEach(function (continent) {
  continent.addEventListener('click', function(e) {
    e.preventDefault();
    hideCountries();
    var query = `.${e.target.innerText.split(' ')[0]}`;
    const continentCountries = document.querySelectorAll(query);
    continentCountries.forEach(function (c) {
      c.classList.remove('hidden');
      countriesList.appendChild(c);
    })
  })
})

function hideCountries() {
  if (countriesList.hasChildNodes()) {
  var children = countriesList.childNodes;
  children.forEach(function (c) {
    c.classList.add('hidden');
    })
  }
}
