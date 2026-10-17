
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Ybouzafo (YbT42)
 * @dev Projet Tokenizer - Standard ERC-20 / BEP-20
 */
contract YbouzafoToken42 is ERC20, Ownable {

    // Événement personnalisé pour suivre la création de tokens
    event TokensMinted(address indexed to, uint256 amount);

    /**
     * @dev Constructeur exécuté une seule fois lors du déploiement.
     * @param initialSupply La quantité initiale de tokens générée au lancement.
     */
    constructor(uint256 initialSupply) 
        ERC20("YbouzafoToken42", "YbT42") 
        Ownable(msg.sender) 
    {
        // Création (mint) de la réserve initiale envoyée au créateur du contrat
        _mint(msg.sender, initialSupply * (10 ** decimals()));
    }

    /**
     * @dev Permet au propriétaire (onlyOwner) de fabriquer de nouveaux tokens.
     * @param to L'adresse du destinataire des nouveaux tokens.
     * @param amount Le nombre de tokens à générer (sans soucis des décimales).
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * (10 ** decimals()));
        emit TokensMinted(to, amount);
    }

    /**
     * @dev Permet à n'importe quel utilisateur de brûler (détruire) ses propres tokens.( msg.sender -> veux dire ces propres tokens )
     * @param amount Le nombre de tokens à détruire.
     */
    function burn(uint256 amount) external {
        _burn(msg.sender, amount * (10 ** decimals()));
    }
}