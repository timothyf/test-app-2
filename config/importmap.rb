# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Vue.js 3
pin "vue", to: "https://cdn.jsdelivr.net/npm/vue@3.4.21/dist/vue.esm-browser.prod.js"
pin_all_from "app/javascript/vue", under: "vue"
