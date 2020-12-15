
const show = (element, elementhide) => {
  if (document.querySelector(element)) {
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
};

const showNoMove = (element, elementhide) => {
  if (document.querySelector(element)) {
    const button = document.querySelector(element);
    button.addEventListener('click', (e) => {
      const paraMostrar = document.querySelector(elementhide);
        if (paraMostrar.style.display === 'none') {
          paraMostrar.style.display = 'block';
        } else {
          paraMostrar.style.display = 'none';
        };
    });
  };
};

const showCategory = () => {
  if (document.querySelector("#complaint_custom_true")) {
    const button_true = document.querySelector("#complaint_custom_true");
    const button_false = document.querySelector("#complaint_custom_false");
    button_true.addEventListener('click', (e) => {
      show('#complaint_with_attach_false', '#categories-custom');
      show('.button-5', '#categories-custom');
      document.querySelector('#categories-intern').style.display = 'none';
    });
    button_false.addEventListener('click', (e) => {
      show('#complaint_with_attach_false', '#categories-intern');
      show('.button-5', '#categories-intern');
      document.querySelector('#categories-custom').style.display = 'none';
    });
  };
};



export { show, showNoMove, showCategory };
