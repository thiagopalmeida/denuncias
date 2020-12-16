const initComplements = () => {
  const revCompl = document.getElementById("review_compl");
  revCompl.addEventListener("click", (e) => {
    const description = document.getElementById("complement_additional_information").value;
    const description_field = document.getElementById("info_add_modal");
      description_field.innerText = description;
    document.getElementById("complement_attachment").value;
    const files = document.querySelector(".form-control-file").files;
    const att_field = document.getElementById("attachments");
    if (files.length > 0) {
      for (var i = 0; i < files.length; i++) {
        att_field.innerHTML += (files[i].name) + "<br />";
      };
    } else {
       att_field.innerText = "Nenhum arquivo anexado"
    };
  });
}
export { initComplements }
