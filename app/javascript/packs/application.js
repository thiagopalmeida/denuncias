// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/verify"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initDragula } from '../plugins/dragula';
import { loadTyped } from '../plugins/typed';
import {initComplaints} from '../components/complaintsForm';
import {initComplements} from '../components/complementsForm';
import { show, showNoMove, showCategory } from '../components/show';

document.addEventListener('turbolinks:load', () => {

  const revInfo = document.getElementById("review_info");
  if (revInfo){
    initComplaints();
  };
  const revCompl = document.getElementById("review_compl");
  if (revCompl){
    initComplements();
  };
  initDragula();
  loadTyped();
  show('.button-1', '#element-hide-1');
  show('.button-2', '#element-hide-2');
  showNoMove('#complaint_know_ni_true', '#element-hide-3a');
  showNoMove('#complaint_know_ni_false', '#element-hide-3b');
  show('.button-3a', '#element-hide-4');
  show('.button-3b', '#element-hide-4');
  show('.button-4', '#element-hide-5');
  showNoMove('#complaint_with_attach_true', '#element-hide-6a');
  show('#complaint_with_attach_false', '#element-hide-7');
  show('.button-5', '#element-hide-7');
  showNoMove('#review_info', '#element-hide-8');
  showCategory();
});
