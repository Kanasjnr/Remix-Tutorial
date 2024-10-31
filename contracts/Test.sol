// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract BaseStore {
    uint256 public ricePrice = 1200;
    uint256 public waterBottlePrice = 3000;
    uint256 public burgerPrice = 5000;
    uint256 public shawarmaPrice = 4000;

    function getPrices() public view virtual returns (
        uint256 _ricePrice, 
        uint256 _waterBottlePrice, 
        uint256 _burgerPrice, 
        uint256 _shawarmaPrice
    ) {
        return (ricePrice, waterBottlePrice, burgerPrice, shawarmaPrice);
    }
}

contract IkoroduStore is BaseStore {
    function getPrices() public view virtual override returns (
        uint256 _ricePrice, 
        uint256 _waterBottlePrice, 
        uint256 _burgerPrice, 
        uint256 _shawarmaPrice
    ) {
        (
            uint256 baseRicePrice, 
            uint256 baseWaterBottlePrice, 
            uint256 baseBurgerPrice, 
            uint256 baseShawarmaPrice
        ) = super.getPrices();

        return (
            baseRicePrice * 10, 
            baseWaterBottlePrice * 10, 
            baseBurgerPrice * 10, 
            baseShawarmaPrice * 10
        );
    }
}

contract MainlandStore is BaseStore{
     function getPrices() public view virtual override returns (
        uint256 _ricePrice, 
        uint256 _waterBottlePrice, 
        uint256 _burgerPrice, 
        uint256 _shawarmaPrice
    ) {
        (
            uint256 baseRicePrice, 
            uint256 baseWaterBottlePrice, 
            uint256 baseBurgerPrice, 
            uint256 baseShawarmaPrice
        ) = super.getPrices();

        return (
            baseRicePrice * 15, 
            baseWaterBottlePrice * 15, 
            baseBurgerPrice * 15, 
            baseShawarmaPrice * 15
        );
    }
}

contract ViStore is BaseStore, IkoroduStore ,MainlandStore {
     function getPrices() public view virtual override(BaseStore, IkoroduStore ,MainlandStore) returns (
        uint256 _ricePrice, 
        uint256 _waterBottlePrice, 
        uint256 _burgerPrice, 
        uint256 _shawarmaPrice
    ) {
        (
            uint256 baseRicePrice, 
            uint256 baseWaterBottlePrice, 
            uint256 baseBurgerPrice, 
            uint256 baseShawarmaPrice
        ) = super.getPrices();

        return (
            baseRicePrice *= 25, 
            baseWaterBottlePrice *= 25, 
            baseBurgerPrice *= 25, 
            baseShawarmaPrice *= 25
        );
    }
}


