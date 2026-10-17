# Guide technique — ybtoken (ybt4)

Ce document explique comment compiler, déployer et utiliser le smart contract `ybtoken`. Pour la vision et l'économie du token, voir le [livre blanc](WHITEPAPER.md).

---

## Sommaire

1. [Spécifications techniques](#1-spécifications-techniques)
2. [Prérequis et outils](#2-prérequis-et-outils)
3. [Compilation et déploiement](#3-compilation-et-déploiement)
4. [Guide d'utilisation du token](#4-guide-dutilisation-du-token)
5. [Se reconnecter au contrat](#5-se-reconnecter-au-contrat-sans-redéployer)
6. [Dépannage](#6-dépannage)

---

## 1. Spécifications techniques

| Propriété | Valeur |
|---|---|
| Standard | ERC-20 |
| Nom | ybtoken |
| Symbole | `ybt4` |
| Décimales | `18` |
| Offre initiale | 1 000 000 ybt4 |
| Réseau de déploiement | Sepolia Testnet (Chain ID `11155111`) |
| Compilateur | Solidity `0.8.20` |
| Fichier source | [`code/ybtoken.sol`](../code/ybtoken.sol) |
| **Adresse du contrat déployé** | `0x...` *(à remplacer par l'adresse exacte)* |
| **Explorateur** | `https://sepolia.etherscan.io/address/0x...` *(à compléter)* |

---

## 2. Prérequis et outils

| Outil | Utilité | Lien |
|---|---|---|
| Remix IDE | Écrire, compiler et déployer le contrat | https://remix.ethereum.org |
| MetaMask | Portefeuille pour signer les transactions | https://metamask.io |
| Faucet Sepolia | SepoliaETH gratuit pour payer le gas | https://cloud.google.com/application/web3/faucet/ethereum/sepolia |
| Sepolia Etherscan | Consulter le contrat publiquement | https://sepolia.etherscan.io |

**Avant de commencer, il faut :**

- un portefeuille MetaMask connecté au réseau **Sepolia** ;
- un solde de **SepoliaETH** pour payer le gas (voir le [README](../README.md), étapes 1 à 3, pour la création du portefeuille, l'activation de Sepolia et l'obtention de fonds).

---

## 3. Compilation et déploiement

### 3.1 Compilation dans Remix IDE

1. Ouvrez [remix.ethereum.org](https://remix.ethereum.org).
2. Dans `contracts`, créez le fichier `ybtoken.sol` et collez-y le code de `code/ybtoken.sol`.
3. Ouvrez l'onglet **Solidity Compiler**.
4. Sélectionnez la version du compilateur **0.8.20**.
5. Cochez **Enable optimization** (runs : `200`).
6. Cliquez sur **Compile ybtoken.sol**. Une coche verte confirme la réussite (un avertissement SPDX est sans danger).

### 3.2 Déploiement via Injected Provider — MetaMask

1. Ouvrez l'onglet **Deploy & Run Transactions**.
2. Dans **Environment**, choisissez **Injected Provider — MetaMask**.
3. Approuvez la connexion dans MetaMask et vérifiez que le réseau est **Sepolia**.
4. Sélectionnez `ybtoken` dans la liste **Contract**.
5. Cliquez sur **Deploy** et confirmez dans MetaMask.
6. Une fois la transaction confirmée, le contrat apparaît sous **Deployed Contracts**. Copiez son adresse : c'est elle qu'il faut renseigner dans la section 1 de ce guide.

À l'issue du déploiement, le portefeuille qui a déployé devient le **propriétaire** et reçoit les 1 000 000 ybt4 initiaux.

---

## 4. Guide d'utilisation du token

Toutes les actions se font dans Remix sous **Deployed Contracts** → développez le contrat.

- **Boutons bleus** : lecture, gratuits.
- **Boutons orange** : transactions, gas nécessaire, confirmation dans MetaMask.

### 4.1 Importer ybt4 dans MetaMask

1. Dans MetaMask, avec Sepolia sélectionné, descendez dans la liste des tokens et cliquez sur **Import tokens**.
2. Collez l'adresse du contrat dans **Token contract address**.
3. MetaMask remplit automatiquement le symbole (`ybt4`) et les décimales (`18`).
4. Cliquez sur **Next**, puis **Import**.
5. Le solde s'affiche (1 000 000 ybt4 pour le propriétaire).

> Si le solde n'apparaît pas immédiatement, c'est un délai d'affichage fréquent. `balanceOf` dans Remix et Sepolia Etherscan donnent toujours le solde réel.

### 4.2 Gestion des 18 décimales (important)

Le token utilise 18 décimales : **1 token = 10^18 unités élémentaires (wei)**.

- `balanceOf` et `totalSupply` renvoient toujours des valeurs **en wei**. Exemple : 1 000 000 tokens s'affichent `1000000000000000000000000`.
- Pour `mint`, `transfer` et `burn`, le paramètre `amount` s'exprime dans l'une de ces deux unités, selon l'écriture du contrat :

| Cas | Ce qu'il faut saisir pour 500 tokens |
|---|---|
| Le contrat **multiplie automatiquement** par 10^18 | `500` |
| Le contrat **ne multiplie pas** | `500000000000000000000` (500 suivi de 18 zéros) |

> ✏️ **À compléter avant le rendu :** gardez uniquement la ligne qui correspond à votre contrat et supprimez l'autre. Pour le savoir, regardez si le code contient `amount * 10 ** decimals()` (ou équivalent). Sinon, testez avec `transfer` d'un petit montant et comparez le résultat avec `balanceOf`.

### 4.3 Créer des tokens — `mint(to, amount)`

Réservé au **propriétaire**.

1. Connectez dans MetaMask le compte propriétaire (celui qui a déployé).
2. Dans Remix, dépliez `mint`.
3. Renseignez :
   - `to` : l'adresse qui reçoit les nouveaux tokens ;
   - `amount` : la quantité (voir la [section 4.2](#42-gestion-des-18-décimales-important) pour l'unité).
4. Cliquez sur **transact** et confirmez dans MetaMask.
5. Vérifiez avec `balanceOf(to)` et `totalSupply()` : l'offre totale a augmenté.

Si un autre compte appelle `mint`, la transaction échoue : seul le propriétaire est autorisé.

### 4.4 Transférer des tokens — `transfer(to, amount)`

1. Dans Remix, dépliez `transfer`.
2. Renseignez :
   - `to` : l'adresse du destinataire ;
   - `amount` : la quantité (voir la [section 4.2](#42-gestion-des-18-décimales-important)).
3. Cliquez sur **transact** et confirmez dans MetaMask.
4. Vérifiez avec `balanceOf` sur l'adresse de l'expéditeur et du destinataire. `totalSupply` ne change pas.

Le transfert échoue si le solde de l'expéditeur est insuffisant.

### 4.5 Détruire des tokens — `burn(amount)`

1. Dans Remix, dépliez `burn`.
2. Renseignez `amount` : la quantité à détruire (voir la [section 4.2](#42-gestion-des-18-décimales-important)).
3. Cliquez sur **transact** et confirmez dans MetaMask.
4. Vérifiez avec `balanceOf` (votre solde baisse) et `totalSupply` (l'offre totale baisse aussi).

`burn` ne détruit que les tokens de l'appelant, et l'action est **définitive**.

### 4.6 Fonctions de lecture

| Fonction | Entrée | Résultat |
|---|---|---|
| `balanceOf` | adresse | Solde de cette adresse, en wei |
| `totalSupply` | aucune | Offre totale actuelle, en wei |
| `owner` | aucune | Adresse du propriétaire (seule autorisée à appeler `mint`) |

### 4.7 Voir le token sur Etherscan

Collez l'adresse du contrat sur [sepolia.etherscan.io](https://sepolia.etherscan.io) pour consulter le token, ses transactions et ses détails publics.

---

## 5. Se reconnecter au contrat (sans redéployer)

Le contrat reste en ligne en permanence sur Sepolia. Pour l'utiliser à nouveau :

1. Ouvrez Remix, chargez `ybtoken.sol` et compilez avec Solidity `0.8.20`.
2. Dans **Deploy & Run Transactions**, choisissez **Injected Provider — MetaMask**.
3. Connectez le même portefeuille, sur **Sepolia**.
4. Sous **Deployed Contracts**, cliquez sur **At Address**.
5. Collez l'adresse du contrat : il se charge et est prêt à l'emploi.

---

## 6. Dépannage

| Problème | Cause probable et solution |
|---|---|
| Sepolia n'apparaît pas dans MetaMask | Activez **Show test networks** (voir le README, étape 2) |
| Le déploiement échoue | Vérifiez le réseau (Sepolia), l'environnement (**Injected Provider**) et le solde en SepoliaETH |
| `mint` échoue | Seul le propriétaire peut minter : vérifiez avec `owner` que vous utilisez le bon compte |
| `transfer` ou `burn` échoue | Solde insuffisant, ou montant saisi dans la mauvaise unité (voir la section 4.2) |
| Le solde ybt4 n'apparaît pas dans MetaMask | Importez le token, puis vérifiez avec `balanceOf` ou Etherscan |
| Le montant semble minuscule ou gigantesque | Confusion tokens/wei : voir la section 4.2 |
