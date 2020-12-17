import dragula from 'dragula'

const initDragula = () => {
  if (document.querySelector('#rec')) {
    const rec = document.querySelector('#rec');
    const enc = document.querySelector('#enc');
    const fin = document.querySelector('#fin');
    const tabelas = [rec, enc, fin];
    const opcao = {
      accepts: function (el, target, source, sibling) {
        if (source === rec && target === enc) {
          return true;
        }
        else
        if (source === enc && target === fin) {
          return true;
        }
        else
          return false;
        end
        },
      moves: function moves (el, source, handle, sibling) {
        if (source.id === "fin") {
          return false;
        }
        else
          return true;
      }
    }
    const drake = dragula(tabelas, opcao);

    const change_status = (el, target, source, sibling) => {
      let route = el.dataset.ajaxPath;
      let table = el.dataset.tableSource;
      if (table === "recebida") {
        $('#enc-ua').modal('toggle');
        const form = document.getElementById('form-id')
        console.log(form);
        form.action = `${route}`
        $.ajax({
          type: "PATCH",
          url: route,
          data: {status: "encaminhada", myInfo: "status_rf"},
          sucess(data) {
            return false;
          },
          error(data) {

            return false;
          }
        });
      }
      else {
        $.ajax({
          type: "PATCH",
          url: route,
          data: "status=finalizada",
          sucess(data) {
            return false;
          },
          error(data) {
            return false;
          }
        });
      }
    }
    drake.on("drop", change_status);
  }
}
export { initDragula }
