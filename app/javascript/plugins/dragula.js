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
}

export { initDragula }
