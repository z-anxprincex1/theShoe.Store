var content = document.querySelectorAll(".content");
var contentHeader = document.querySelectorAll(".content-header");
var contentImage = document.querySelectorAll(".content-image");
var contentTest = document.querySelector(".content-test");
var shoeID = document.querySelector(".span-shoeID");

var buyNow = document.querySelectorAll(".buyNow-Btn");

console.log(buyNow.classList);

buyNow.forEach((buttonItem) => {
    buttonItem.addEventListener("click", () => {
        console.log("Button Click Performed!");
    })
})


console.log(contentHeader[0].childNodes[0].textContent);
sessionStorage.setItem("shoeName", contentHeader[0].childNodes[0].textContent)


content.forEach((item) => {
    item.classList.add("enlarge");
    item.classList.add("transparancy");

    item.addEventListener("mouseenter", () => {
        console.log(item.childNodes);
        item.childNodes[1].classList.remove("content-test1");
        item.childNodes[1].classList.add("un-hide");
        item.childNodes[2].classList.remove("content-test1");
        item.childNodes[2].classList.add("un-hide-price");
        
        item.childNodes[3].classList.remove("content-test1");
        item.childNodes[3].classList.add("buyNow-btn");

        item.childNodes[4].classList.remove("content-test1");
        item.childNodes[4].classList.add("un-hide-desc");
        // buyNow.forEach((buttonItem) => {
        //     buttonItem.classList.remove("content-test1");
        //     buttonItem.classList.add("buyNow-btn");
        // });
    });

    item.addEventListener("mouseleave", () => { 
        item.childNodes[1].classList.add("content-test1");
        item.childNodes[1].classList.remove("un-hide");
        item.childNodes[2].classList.add("content-test1");
        item.childNodes[2].classList.remove("un-hide-price");
        
        item.childNodes[3].classList.add("content-test1");
        item.childNodes[3].classList.remove("buyNow-btn");

        item.childNodes[4].classList.add("content-test1");
        item.childNodes[4].classList.remove("un-hide-desc");
        // buyNow.forEach((buttonItem) => {
        //     buttonItem.classList.add("content-test1");
        //     buttonItem.classList.remove("buyNow-btn");
        // });
    })
})

