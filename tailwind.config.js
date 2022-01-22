module.exports = {
  mode: 'jit',
  content: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
  ],
  plugins: [
    require('@tailwindcss/forms')
  ],
}
