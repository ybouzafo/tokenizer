# Livre blanc — YbouzafoToken42 (YbT42)

> Version 1.0 · Réseau : Sepolia Testnet · Standard : ERC-20

---

## 1. Introduction et vision

### 1.1 Contexte

Les tokens ERC-20 sont la brique de base de la plupart des applications de la finance décentralisée (DeFi), des DAO et des jeux en ligne. Pourtant, comprendre concrètement comment un token est créé, émis, transféré et détruit demande de passer par la pratique.

### 1.2 Objectif de YbouzafoToken42

**YbouzafoToken42 (symbole `YbT42`)** est un token ERC-20 pédagogique déployé sur le testnet Sepolia. Son but est de :

- illustrer de bout en bout le cycle de vie d'un token (création, distribution, transfert, destruction) ;
- servir de base simple et lisible pour apprendre à écrire, compiler, déployer et utiliser un smart contract ;
- fournir un exemple clair de gestion des droits d'administration (un seul propriétaire autorisé à créer de nouveaux tokens).

### 1.3 Cas d'usage

| Cas d'usage | Description |
|---|---|
| Apprentissage | Support pour comprendre le standard ERC-20 et les outils Remix et MetaMask |
| Démonstration | Exemple concret à montrer lors d'une évaluation ou d'une présentation |
| Unité d'échange de test | Monnaie fictive pour tester des transferts entre comptes sur un réseau de test |

> ⚠️ **YbT42 n'a aucune valeur financière.** Il vit sur un testnet, ne peut pas être acheté ou vendu sur un marché réel et ne constitue ni un investissement ni une promesse de gain.

---

## 2. Tokenomics

### 2.1 Caractéristiques générales

| Propriété | Valeur |
|---|---|
| Nom | YbouzafoToken42 |
| Symbole | `YbT42` |
| Standard | ERC-20 |
| Décimales | `18` |
| Réseau | Sepolia Testnet |
| Type d'offre | **Dynamique** (création par le propriétaire, destruction par les détenteurs) |

### 2.2 Distribution initiale

Au déploiement, **1 000 YbT42** sont créés et attribués en totalité à l'adresse qui déploie le contrat (le *deployer*), qui devient aussi le **propriétaire** du contrat.

| Destinataire | Quantité | Part |
|---|---|---|
| Adresse du déployeur (propriétaire) | 1 000 000 YbT42 | 100 % |

Aucune allocation à une équipe, à des investisseurs ou à une réserve n'existe : il s'agit d'un token de test.

### 2.3 Mécanismes

| Mécanisme | Fonction | Qui peut l'utiliser | Effet sur l'offre |
|---|---|---|---|
| **Création** | `mint(to, amount)` | Le propriétaire uniquement | L'offre totale **augmente** |
| **Transfert** | `transfer(to, amount)` | Tout détenteur de YbT42 | L'offre totale ne change pas |
| **Destruction** | `burn(amount)` | Tout détenteur, sur son propre solde | L'offre totale **diminue** |

Fonctions de lecture (gratuites) : `balanceOf(address)`, `totalSupply()`, `owner()`.

**Précision numérique.** Avec 18 décimales, 1 token correspond à 10^18 unités élémentaires (wei). Un solde de 1 000 000 YbT42 est donc lu comme `1000000000000000000000000` par `balanceOf`. Voir le [guide technique](TECHNICAL_GUIDE.md) pour savoir quelle unité saisir dans `mint`, `transfer` et `burn`.

### 2.4 Évolution de l'offre

L'offre totale évolue ainsi :

```
offre totale = offre initiale + somme des mint − somme des burn
```

Comme le propriétaire peut créer de nouveaux tokens sans limite, l'offre n'est pas plafonnée. C'est un choix assumé pour un token de test : il permet de démontrer la création de tokens à volonté.

---

## 3. Modèle de sécurité et rôles

### 3.1 Rôles

| Rôle | Qui | Droits |
|---|---|---|
| **Propriétaire** (`owner`) | L'adresse qui a déployé le contrat | Appeler `mint` ; peut aussi transférer et brûler comme tout détenteur |
| **Détenteur** | Toute adresse possédant des YbT42 | Appeler `transfer` et `burn` sur ses propres tokens |
| **Observateur** | Toute personne | Lire les données publiques (`balanceOf`, `totalSupply`, `owner`) et consulter Etherscan |

### 3.2 Pourquoi restreindre `mint` au propriétaire

Si n'importe qui pouvait appeler `mint`, chacun pourrait créer une quantité illimitée de tokens, ce qui rendrait la notion de rareté, et donc de valeur, inexistante. La restriction `onlyOwner` garantit que la création de nouveaux tokens reste une décision contrôlée. À l'inverse, `burn` ne peut détruire que les tokens de l'appelant : personne ne peut détruire les tokens d'un autre.

### 3.3 Risques et limites connus

| Risque | Explication | Atténuation |
|---|---|---|
| **Centralisation** | Le propriétaire contrôle seul la création de tokens | Acceptable pour un token de test ; sur mainnet, on utiliserait un multisig ou une gouvernance |
| **Perte ou vol de la clé du propriétaire** | Celui qui contrôle la clé peut créer des tokens à volonté | Garder la phrase secrète hors ligne ; utiliser un portefeuille dédié aux tests |
| **Pas d'audit** | Le contrat n'a pas fait l'objet d'un audit de sécurité | Ne jamais réutiliser tel quel sur mainnet avec de vrais fonds |
| **Offre non plafonnée** | Aucune limite maximale de création | Choix assumé pour la démonstration |
| **Contrat non modifiable** | Une fois déployé, le code ne peut plus être changé | Redéployer un nouveau contrat en cas de correction |

---

## 4. Résumé

YbouzafoToken42 (`YbT42`) est un token ERC-20 de démonstration à offre dynamique : 1 000 000 de tokens sont émis au déploiement, seul le propriétaire peut en créer de nouveaux, et chaque détenteur peut transférer ou détruire ses propres tokens. Il sert de support clair pour comprendre le cycle de vie d'un token, sans valeur financière.

Pour installer, déployer et utiliser le token, voir le [guide technique](TECHNICAL_GUIDE.md).
