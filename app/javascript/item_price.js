window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    //入力された値を取得
    const inputValue = priceInput.value;
    //手数料・利益のidを取得
    const addTaxDom = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    addTaxDom.innerHTML =  Math.floor( inputValue * 0.1 )
    profit.innerHTML = Math.floor( inputValue - inputValue * 0.1 )
  })
  
});