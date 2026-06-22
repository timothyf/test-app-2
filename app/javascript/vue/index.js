import { createApp } from "vue"

// Import Vue components here
// import ExampleComponent from "vue/example_component"

// Mount Vue apps using data-vue-app attributes
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-vue-app]").forEach((el) => {
    const appName = el.dataset.vueApp
    const apps = { /* register named apps here */ }
    if (apps[appName]) {
      createApp(apps[appName]).mount(el)
    }
  })
})
