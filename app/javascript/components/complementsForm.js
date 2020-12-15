const initComplements = () => {
  if (document.getElementById("review_compl")) {
    const revCompl = document.getElementById("review_compl");
    revCompl.addEventListener("click", (e) => {
      const description = document.getElementById("complement_additional_information").value;
      const description_field = document.getElementById("description_modal");
        description_field.innerText = description;
      const attachments = document.getElementById("complement_attachment").value;
      const att_field = document.getElementById("attachments");
        att_field.innerText = attachments;
    });
  }
}
export { initComplements }
