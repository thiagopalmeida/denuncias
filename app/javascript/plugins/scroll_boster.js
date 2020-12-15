import ScrollBooster from 'scrollbooster';

const initScroll = () => {
  new ScrollBooster({
    viewport: document.querySelector('.viewport'),
    content: document.querySelector('.content'),
    scrollMode: 'transform',
    direction: 'horizontal',
    emulateScroll: true,
  });
}

export { initScroll }
