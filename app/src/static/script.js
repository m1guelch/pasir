document.addEventListener("DOMContentLoaded", function() {
    const counterBox = document.querySelector(".counter-box");

    counterBox.addEventListener("mouseenter", function() {
        counterBox.style.transform = "scale(1.05)";
    });

    counterBox.addEventListener("mouseleave", function() {
        counterBox.style.transform = "scale(1)";
    });
});
