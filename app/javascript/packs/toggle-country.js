const continents = document.querySelectorAll('.continent-link');
const cardsList = document.querySelector('.cards-list');

continents.forEach(function (continent) {
  continent.addEventListener('click', function(e) {
    e.preventDefault();
    hideCountries();
    var query = `.${e.target.innerText.split(' ')[0]}`;
    const continentCountries = document.querySelectorAll(query);
    continentCountries.forEach(function (c) {
      c.classList.remove('hidden');
      cardsList.appendChild(c);
    })
  })
})

function hideCountries() {
  if (cardsList.hasChildNodes()) {
  var children = cardsList.childNodes;
  children.forEach(function (c) {
    c.classList.add('hidden');
    })
  }
}
