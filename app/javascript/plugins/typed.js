import Typed from 'typed.js';

const loadTyped = () => {
    if (document.getElementById('typed')) {
      new Typed('#typed', {
        strings: [" ao descaminho ", " ao contrabando ", " à corrupção ", " à contrafação ", " à sonegação "],
        typeSpeed: 80,
        startDelay: 2000,
        fadeOut: true,
        showCursor: false,
        smartBackspace: true,
        loop: true,
        loopCount: 4
      });
    }

}

export { loadTyped };
