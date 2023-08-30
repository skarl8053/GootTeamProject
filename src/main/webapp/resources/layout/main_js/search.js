document.addEventListener("DOMContentLoaded", function () {
    const decrementButtons = document.querySelectorAll(".decrement-btn");
    const incrementButtons = document.querySelectorAll(".increment-btn");
    const countSpans = document.querySelectorAll(".count");

    decrementButtons.forEach((button) => {
        button.addEventListener("click", function () {
        const parent = button.closest(".person");
        const countSpan = parent.querySelector(".count");
        let count = parseInt(countSpan.textContent);
        if (count > 0) {
            count--;
            countSpan.textContent = count;
        }
    });
});

    incrementButtons.forEach((button) => {
        button.addEventListener("click", function () {
        const parent = button.closest(".person");
        const countSpan = parent.querySelector(".count");
        let count = parseInt(countSpan.textContent);
        count++;
        countSpan.textContent = count;
        });
    });

});

