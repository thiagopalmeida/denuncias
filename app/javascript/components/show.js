
const show = (element, elementhide) => {
  const button = document.querySelector(element);
  button.addEventListener('click', (e) => {
    const paraMostrar = document.querySelector(elementhide);
      if (paraMostrar.style.display === 'none') {
        paraMostrar.style.display = 'block';
        paraMostrar.scrollIntoView({ block: 'start',  behavior: 'smooth' });
      } else {
        paraMostrar.scrollIntoView({ block: 'start',  behavior: 'smooth' });
      };
  });
};

const go = () => {
  const button = document.querySelector(".button-1");
  button.addEventListener('click', (e) => {
    const element = document.getElementById("form-2");
    element.scrollIntoView({ block: 'start',  behavior: 'smooth' });
  });
}



export { show };
