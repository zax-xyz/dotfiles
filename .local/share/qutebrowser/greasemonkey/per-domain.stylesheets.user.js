// ==UserScript==
// @name        DomainStyles
// @namespace   https://github.com/olmokramer
// @description Make it possible to use per-domain stylesheets.
// @include     *
// @run-at      document-start
// @version     2
// @author      Olmo Kramer
// ==/UserScript==

(function IIFE() {
  'use strict';

  document.addEventListener('readystatechange', function onReadyStateChange() {
    if (document.readyState == 'interactive') {
      const doc = document.documentElement;
      doc.setAttribute('data-qb-url', window.location.href);
      doc.setAttribute('data-qb-domain', window.location.host);
    }
  });
})();
