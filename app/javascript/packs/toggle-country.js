// console.log('Hello form toggle country.js!');

const continents = document.querySelectorAll('.continent-link');

continents.forEach(function (continent) {
  continent.addEventListener('click', function(e) {
    e.preventDefault();
    var query = '.Asia';
    var query = `.${e.target.innerText.split(' ')[0]}`;
    console.log(query);
    const continentCountries = document.querySelectorAll(query);
    continentCountries.forEach(function (c) {
      c.classList.toggle('hidden');
    })
    // console.log(e.target.innerText);
  })
})

// $(document).ready(function () {
//     $("li").click(function () {
//         $('li > ul').not($(this).children("ul").toggle()).hide();

//     });
// });
