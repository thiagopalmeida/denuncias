import { annotate } from 'rough-notation';

const e = document.querySelector('#typed');
const annotation = annotate(e, { animationDelay: 10000, type: 'highlight', color: '#007cbc' });
annotation.show();
annotation.hide();
