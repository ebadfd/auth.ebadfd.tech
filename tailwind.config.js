/** @type {import('tailwindcss').Config} */
export default {
    content: ["./index.html", "./src/**/*.{ts,tsx}"],
    theme: {
        extend: {
            fontFamily: {
                firamono: ["Fira Mono", "serif"],
            }
        }
    },
    plugins: []
};
