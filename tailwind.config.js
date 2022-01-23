module.exports = {
  mode: 'jit',
  content: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
  ],
  safelist: [
    'border-red-500',
    'focus:border-red-600',
    'focus:ring-red-600',
    'text-red-500',
  ],
  plugins: [
    require('@tailwindcss/forms')
  ],
}
