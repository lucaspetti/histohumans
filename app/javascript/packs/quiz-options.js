function showCorrect(options) {
  for (let option of options) {
    if(option.dataset.attribute === "true") {
      option.classList.add('green');
    } else {
      option.classList.add('red');
    }
    // option.removeEventListener('click', function);
    option.removeAttribute('href');
  }
}

function answerQuiz(e) {
  e.preventDefault();
  if(option.dataset.attribute === "true") {
    score.innerHTML = parseInt(score.innerHTML) + 1;
    score.classList.add('score-up');
  }
  showCorrect(options);
}

function removeTransition(e) {
  if (e.propertyName !== 'transform') return;
  e.target.classList.remove('score-up');
}

const questionContainers = document.querySelectorAll('.question-container');
const score = document.getElementById('score');
score.addEventListener('transitionend', removeTransition);

questionContainers.forEach(function (container) {
  const options = container.getElementsByClassName('quiz-option');
  for (let option of options) {
    option.addEventListener('click', function(e) {
      e.preventDefault();
      if(option.dataset.attribute === "true") {
        score.innerHTML = parseInt(score.innerHTML) + 1;
        score.classList.add('score-up');
      }
      showCorrect(options);
    }, {once : true});
  }
})


