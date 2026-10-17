# ybtoken (ybt4)

Token ERC-20 pédagogique déployé sur le **testnet Sepolia**. Ce dépôt contient le smart contract, ainsi que toute la documentation nécessaire pour comprendre le token, le déployer et l'utiliser.

> 🧪 ybt4 vit sur un réseau de test : il n'a **aucune valeur financière**.

---

## Le projet en bref

| Propriété | Valeur |
|---|---|
| Nom | ybtoken |
| Symbole | `ybt4` |
| Standard | ERC-20 |
| Décimales | `18` |
| Offre initiale | 1 000 000 ybt4 |
| Type d'offre | Dynamique (création par le propriétaire, destruction par les détenteurs) |
| Réseau | Sepolia Testnet (Chain ID `11155111`) |
| Compilateur | Solidity `0.8.20` |
| Outils | Remix IDE, MetaMask |

**Adresse du contrat :** `0x...` *(à compléter)*

**Explorateur :** [Voir sur Sepolia Etherscan](https://sepolia.etherscan.io/address/0x...) *(à compléter)*

---

## Fonctionnalités

| Fonction | Qui peut l'utiliser | Rôle |
|---|---|---|
| `mint(to, amount)` | Le propriétaire uniquement | Crée de nouveaux ybt4 |
| `transfer(to, amount)` | Tout détenteur | Envoie des ybt4 à une autre adresse |
| `burn(amount)` | Tout détenteur (sur son propre solde) | Détruit des ybt4 définitivement |
| `balanceOf(address)` | Tout le monde | Lit le solde d'une adresse |
| `totalSupply()` | Tout le monde | Lit l'offre totale |
| `owner()` | Tout le monde | Lit l'adresse du propriétaire |

---

## Structure du dépôt

```
.
├── README.md                     ← vous êtes ici : vue d'ensemble du projet
├── code/
│   └── ybtoken.sol               ← le smart contract
└── documentation/
    ├── WHITEPAPER.md             ← livre blanc : vision, tokenomics, sécurité
    ├── TECHNICAL_GUIDE.md        ← guide technique : spécifications, déploiement, utilisation
    ├── SETUP_GUIDE.md            ← guide d'installation pas à pas (anglais)
    └── SETUP_GUIDE.fr.md         ← guide d'installation pas à pas (français)
```

---

## Documentation

| Document | Pour quoi faire | Lien |
|---|---|---|
| Livre blanc | Comprendre le rôle du token, son économie et son modèle de sécurité | [WHITEPAPER.md](documentation/WHITEPAPER.md) |
| Guide technique | Connaître les spécifications, compiler, déployer et utiliser chaque fonction | [TECHNICAL_GUIDE.md](documentation/TECHNICAL_GUIDE.md) |
| Guide d'installation (FR) | Partir de zéro : MetaMask, Sepolia, faucet, Remix | [SETUP_GUIDE.fr.md](documentation/SETUP_GUIDE.fr.md) |
| Guide d'installation (EN) | Même guide en anglais | [SETUP_GUIDE.md](documentation/SETUP_GUIDE.md) |

---

## Démarrage rapide

1. **Préparer le portefeuille** : installez [MetaMask](https://metamask.io), activez les réseaux de test et sélectionnez **Sepolia**.
2. **Obtenir du SepoliaETH** : demandez des fonds gratuits au [faucet Sepolia](https://cloud.google.com/application/web3/faucet/ethereum/sepolia).
3. **Compiler** : dans [Remix](https://remix.ethereum.org), créez `ybtoken.sol` avec le code de [`code/ybtoken.sol`](code/ybtoken.sol), puis compilez avec Solidity `0.8.20`.
4. **Déployer** : dans **Deploy & Run Transactions**, choisissez **Injected Provider — MetaMask** (réseau Sepolia) et cliquez sur **Deploy**.
5. **Importer le token** : dans MetaMask, **Import tokens**, collez l'adresse du contrat.
6. **Utiliser le token** : appelez `mint`, `transfer` et `burn` depuis Remix.

Le détail de chaque étape est dans le [guide d'installation](documentation/SETUP_GUIDE.fr.md) et le [guide technique](documentation/TECHNICAL_GUIDE.md).

> ⚠️ **18 décimales** : `balanceOf` et `totalSupply` renvoient des valeurs en wei (1 token = 10^18). La façon de saisir `amount` dans `mint`, `transfer` et `burn` est expliquée à la section 4.2 du [guide technique](documentation/TECHNICAL_GUIDE.md#42-gestion-des-18-décimales-important).

---

## Sécurité

- Ne partagez **jamais** votre phrase secrète de récupération ni votre clé privée.
- Utilisez un **portefeuille dédié aux tests**, pas celui qui contient de vrais fonds.
- Le contrat n'a **pas été audité** : ne le réutilisez pas tel quel sur mainnet.
- Le propriétaire contrôle seul la création de tokens (`mint`). Voir le [livre blanc](documentation/WHITEPAPER.md#3-modèle-de-sécurité-et-rôles) pour les risques connus.

---

## Auteur

**Auteur :** *(votre nom ou pseudo)*

**Contact :** *(optionnel)*
