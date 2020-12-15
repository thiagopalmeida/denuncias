import { annotate, annotationGroup } from 'rough-notation';

const a1 = annotate(document.querySelector('#dest-1'), { type: 'underline', color: '#007cbc' });
const a2 = annotate(document.querySelector('#dest-2'), { type: 'underline', color: '#007cbc' });
const ag = annotationGroup([a1, a2]);
ag.show();
