function count(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(inputValue * 0.1);

    const addPofitDom = document.getElementById("profit");
    addPofitDom.innerHTML = Math.round(inputValue - Math.round(inputValue * 0.1));
  })
};


window.addEventListener('load',count);