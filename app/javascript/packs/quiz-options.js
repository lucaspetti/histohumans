const options = document.querySelectorAll('.quiz-option');

options.forEach(function (option) {
  option.addEventListener('click', function(e) {
    e.preventDefault();
    showCorrect();
  })
})

function showCorrect() {
  options.forEach(function (option) {
    if(option.dataset.attribute === "true") {
      option.classList.add('green');
    } else {
      option.classList.add('red');
    }
  })
}
