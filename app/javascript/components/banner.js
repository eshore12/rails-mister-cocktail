import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["^700 Kick Back, ^700 Relax, ^700 Have a Drink!^700"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
