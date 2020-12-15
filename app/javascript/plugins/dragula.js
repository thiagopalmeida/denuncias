import dragula from 'dragula'

const initDragula = () => {
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
      }
  }
  const drake = dragula(tabelas, opcao);

  const change_status = (el, target, source, sibling) => {
    let route = el.dataset.ajaxPath;
    let table = el.dataset.tableSource;
    console.log(route)
    console.log(table);
    if (table === "recebida") {
      $.ajax({
        type: "PATCH",
        url: route,
        data: "status=encaminhada",
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
export { initDragula }
