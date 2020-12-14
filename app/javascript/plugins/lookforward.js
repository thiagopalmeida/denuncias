import Lookforward from 'lookforward';

const addTransitions = () => {
  new LookForward('.js-lookforward');
  document.addEventListener("click", () => {
    const links = document.querySelectorAll("a[data-remote]");
    links.forEach((element) => {
      element.classList.add('js-lookforward');
      element.setAttribute("data-transition-enter", "slideup");
      element.setAttribute("data-transition-leave", "slidedown");
    });
  });
};

export { addTransitions };
