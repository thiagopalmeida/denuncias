import Lookforward from 'lookforward';

const lookforward = require('lookforward');
const addTransitions = () => {
  window.addEventListener('DOMContentLoaded',function(){
    new LookForward(".js-lookforward");
  });
};

export { addTransitions };

