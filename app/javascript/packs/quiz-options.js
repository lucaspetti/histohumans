// const options = document.querySelectorAll('.quiz-option');
const questionContainers = document.querySelectorAll('.question-container');
const score = document.getElementById('score');

questionContainers.forEach(function (container) {
  const options = container.getElementsByClassName('quiz-option');
  for (let option of options) {
    option.addEventListener('click', function(e) {
    e.preventDefault();
    showCorrect(options);
    })
  }
})

function showCorrect(options) {
  for (let option of options) {
    if(option.dataset.attribute === "true") {
      option.classList.add('green');
      score.innerHTML = parseInt(score.innerHTML) + 1;
    } else {
      option.classList.add('red');
    }
  }
}
