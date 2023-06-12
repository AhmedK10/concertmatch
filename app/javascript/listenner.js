const heart = document.querySelector('#heart');

heart.addEventListener('click', (event) => {
  event.target.classList.add('red-heart');
});
