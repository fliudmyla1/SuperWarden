import { createApp } from 'vue'
// import Vue from 'vue'

import App from './App.vue'

//import CSS Bootstrap
// import 'jquery/src/jquery.js';
// import $ from "jquery";
// window.$ = $;
import 'bootstrap/dist/css/bootstrap.min.css';
// import { library } from "@fortawesome/fontawesome-svg-core";
// import { fas } from "@fortawesome/free-solid-svg-icons";
// import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
// library.add(fas);



//import CSS custom
// import './index.css';
import './assets/style.css';
import setting from './setting';
window.setting = setting

import api from './api'
window.api = api
// router
import router from './router'
// store 
import store from './store/store'
import 'vue-universal-modal/dist/index.css';
import VueUniversalModal from 'vue-universal-modal';


import Toaster from "@meforma/vue-toaster";

// Create and mount the root instance.
const app = createApp(App)
app.use(VueUniversalModal, {
    teleportTarget: '#modals',
  });

  app.use(Toaster, {
    // One of the options
    position: "top-right",
  });
// app.component("font-awesome-icon", FontAwesomeIcon)
// app.component("font-awesome-icon", FontAwesomeIcon).mount("#app");
app.use(router).use(store).mount('#app')













// createApp(App).mount('#app')
// new Vue({
//     el: '#app',
//     router,
//     store,
//     render: h => h(App)
//   })
