const initComplaints = () => {
  const revInfo = document.getElementById("review_info");
  revInfo.addEventListener("click", (e) => {
    const aduana = document.getElementById("complaint_custom_true");
    const trib_int = document.getElementById("complaint_custom_false");
    const area_field = document.getElementById("area_modal");
      if (aduana.checked) {
        area_field.innerText = 'Aduana';
      }
      if (trib_int.checked) {
        area_field.innerText = 'Tributos Internos';
      }
    const description = document.getElementById("complaint_description").value;
    const description_field = document.getElementById("description_modal");
      description_field.innerText = description;
    const cont_sim = document.getElementById("complaint_keep_sim");
    const cont_nao = document.getElementById("complaint_keep_não");
    const cont_nao_sei = document.getElementById("complaint_keep_não_sei");
    const cont_field = document.getElementById("continuous_modal");
      if (cont_sim.checked) {
        cont_field.innerText = cont_sim.value;
      }
      if (cont_nao.checked) {
        cont_field.innerText = cont_nao.value;
      }
      if (cont_nao_sei.checked) {
        cont_field.innerText = cont_nao_sei.value;
      }
    const denounced_name = document.getElementById("complaint_name").value;
    const name_field = document.getElementById("denounced_modal");
      name_field.innerText = denounced_name;
    const denounced_address= document.getElementById("complaint_address").value;
    const address_field = document.getElementById("address_modal");  
      address_field.innerText = denounced_address;
    const denounced_ni = document.getElementById("complaint_ni_comp").value;
    const ni_field = document.getElementById("ni_modal");      
      ni_field.innerText = denounced_ni;
    const init_year = document.getElementById("complaint_year_comp").value;
    const year_field = document.getElementById("init_year_modal");      
      year_field.innerText = init_year;
    const categories = document.querySelectorAll(".form-check");
    const modal_categories = document.getElementById("categories");
      categories.forEach((element) => {
        const input = element.querySelector(".form-check-input");
        const label = element.querySelector(".form-check-label");
        if (input.checked) {
          modal_categories.innerHTML += label.innerText  + "<br />";
        };
      });
    document.getElementById("attachments").value;
    const files = document.querySelector(".form-control-file").files;
    const att_field = document.getElementById("attachments");      
    for (var i = 0; i < files.length; i++) {
      att_field.innerHTML += (files[i].name) + "<br />";
    };
  });
}
export { initComplaints }
