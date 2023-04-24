/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx}",
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",

    // Or if using `src` directory:
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Montserrat Light", "Helvetica", "Arial", "sans-serif"],
      },
      colors: {
        "my-color": "#FFFFFFCC",
        "about-color": "#F4F4F4",
        "service-color": "#012C42",
      },
    },
  },
  plugins: [],
};
