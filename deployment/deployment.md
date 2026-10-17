# YbouzafoToken42 (YbT42) — Guide de déploiement

Un guide pas à pas, pensé pour les débutants, pour déployer un token ERC-20 sur le **testnet Sepolia**, de la création du portefeuille jusqu'à l'utilisation de votre contrat en ligne.

> 🧪 Sepolia est un réseau de test. Tout y est gratuit et sans valeur réelle, ce qui en fait un endroit sûr pour apprendre.

---

## Le token en un coup d'œil

| Propriété | Valeur |
|---|---|
| Nom | YbouzafoToken42 |
| Symbole | `YbT42` |
| Décimales | `18` |
| Offre initiale | 1 000 000 YbT42 |
| Réseau | Testnet Sepolia |
| Compilateur | Solidity `0.8.20` |
| Fonctions | `mint` (propriétaire uniquement), `transfer`, `burn`, `balanceOf`, `totalSupply`, `owner` |

**Adresse du contrat :** ``

**Explorateur :** [Voir sur Sepolia Etherscan]()

---

## Outils utilisés

| Outil | Utilité | Lien |
|---|---|---|
| MetaMask | Portefeuille pour signer les transactions | https://metamask.io |
| Faucet Sepolia | ETH de test gratuit pour les frais de gas | https://cloud.google.com/application/web3/faucet/ethereum/sepolia |
| Remix IDE | Écrire, compiler et déployer le contrat | https://remix.ethereum.org |
| Sepolia Etherscan | Voir publiquement le contrat déployé | https://sepolia.etherscan.io |

---

## Sommaire

1. [Créer un portefeuille MetaMask](#étape-1--créer-un-portefeuille-metamask)
2. [Activer et sélectionner Sepolia](#étape-2--activer-et-sélectionner-le-testnet-sepolia)
3. [Obtenir de l'ETH de test gratuit](#étape-3--obtenir-de-leth-de-test-gratuit-sepoliaeth)
4. [Créer le fichier du contrat dans Remix](#étape-4--créer-le-fichier-du-contrat-dans-remix)
5. [Compiler le contrat](#étape-5--compiler-le-contrat)
6. [Déployer le contrat](#étape-6--déployer-le-contrat)
7. [Se reconnecter au contrat à tout moment](#étape-7--se-reconnecter-au-contrat-à-tout-moment-sans-redéployer)
8. [Voir le token sur Etherscan](#étape-8--voir-le-token-sur-etherscan)
9. [Ajouter YbT42 dans MetaMask](#étape-9--ajouter-YbT42-dans-metamask)
10. [Utiliser les fonctions du token](#étape-10--utiliser-les-fonctions-du-token)
11. [Dépannage](#dépannage)

---

## Étape 1 — Créer un portefeuille MetaMask

1. Allez sur [metamask.io](https://metamask.io) et cliquez sur **Download**.
2. Installez l'extension de navigateur (Chrome ou Firefox recommandés).
3. Cliquez sur **Create a new wallet**.
4. Choisissez un mot de passe solide.
5. Notez votre **phrase secrète de récupération** (12 mots) et gardez-la en lieu sûr, hors ligne. Si vous la perdez, vous perdez l'accès au portefeuille pour toujours.
6. Confirmez la phrase quand on vous le demande.
7. Votre portefeuille est prêt. Votre adresse publique (qui commence par `0x...`) s'affiche en haut de l'écran.

> ⚠️ **Ne partagez jamais votre phrase secrète de récupération ni votre clé privée**, pas même avec un faucet, un site web ou une personne qui propose du « support ». Seule votre adresse publique est nécessaire.

---

## Étape 2 — Activer et sélectionner le testnet Sepolia

MetaMask masque les réseaux de test par défaut. Les menus changent un peu selon les versions, utilisez donc le chemin qui correspond à votre écran.

**Activer les réseaux de test**

- Ouvrez la liste des réseaux (ou **Manage networks**) et activez l'interrupteur **Show test networks** en bas, **ou**
- Allez dans **Settings → Advanced** (sur certaines versions, **Settings → Security & Privacy**) et activez **Show test networks**.

**Sélectionner Sepolia**

> 💡 L'écran **Manage networks** sert uniquement à configurer les réseaux. On ne peut pas y sélectionner un réseau.

1. Revenez à l'écran principal du portefeuille.
2. Appuyez sur le sélecteur de réseau juste au-dessus de la liste des tokens. Dans les versions récentes, il affiche **All default networks** ; dans les anciennes, il affiche le nom du réseau actuel (par ex. « Ethereum Mainnet ») en haut de l'écran.
3. Choisissez **Sepolia** dans la liste (utilisez la barre de recherche si vous ne le voyez pas).
4. Le sélecteur affiche maintenant **Sepolia**, et votre solde est en **SepoliaETH**.

**Si Sepolia est absent, ajoutez-le manuellement** (Networks → Add network → Add a network manually) :

| Champ | Valeur |
|---|---|
| Nom du réseau | Sepolia |
| URL RPC | `https://sepolia.drpc.org` |
| ID de chaîne | `11155111` |
| Symbole de la devise | `ETH` |
| Explorateur de blocs | `https://sepolia.etherscan.io` |

---

## Étape 3 — Obtenir de l'ETH de test gratuit (SepoliaETH)

Déployer un contrat coûte du gas. Sur un testnet, ce gas est gratuit.

1. Ouvrez le [faucet Sepolia de Google Cloud](https://cloud.google.com/application/web3/faucet/ethereum/sepolia).
2. Connectez-vous avec un compte Google.
3. Copiez votre adresse MetaMask (avec l'icône de copie à côté du nom de votre compte) et collez-la dans le faucet.
4. Demandez les fonds (généralement 0,5 SepoliaETH).
5. Attendez environ 30 secondes.
6. Ouvrez MetaMask, vérifiez que Sepolia est sélectionné, et contrôlez que le solde en SepoliaETH est arrivé.

> ℹ️ Vous pouvez généralement refaire une demande après 24 heures. Si ce faucet ne fonctionne pas pour vous, d'autres faucets Sepolia (Alchemy, Infura, etc.) font le même travail.

---

## Étape 4 — Créer le fichier du contrat dans Remix

1. Ouvrez [remix.ethereum.org](https://remix.ethereum.org).
2. Dans **File Explorer** (panneau de gauche), ouvrez le dossier `contracts` et cliquez sur l'icône **nouveau fichier**.
3. Nommez le fichier `YbouzafoToken42.sol`.
4. Collez le code complet du contrat depuis [`code/YbouzafoToken42.sol`](code/YbouzafoToken42.sol) dans ce dépôt.

---

## Étape 5 — Compiler le contrat

1. Ouvrez l'onglet **Solidity Compiler** (l'icône « S » à gauche).
2. Choisissez la version du compilateur **0.8.20**.
3. Cochez **Enable optimization** (laissez runs à `200`).
4. Cliquez sur **Compile YbouzafoToken42.sol**.
5. Une coche verte signifie que c'est réussi. Un avertissement sur l'identifiant de licence SPDX manquant est sans danger.

---

## Étape 6 — Déployer le contrat

1. Ouvrez l'onglet **Deploy & Run Transactions**.
2. Dans **Environment**, sélectionnez **Injected Provider — MetaMask**.
3. Approuvez la connexion dans MetaMask et vérifiez qu'il est sur **Sepolia**.
4. Vérifiez que `YbouzafoToken42` est sélectionné dans la liste **Contract**.
5. Cliquez sur **Deploy** et confirmez la transaction dans MetaMask.
6. Une fois confirmé, votre contrat apparaît sous **Deployed Contracts**. Copiez son adresse avec l'icône de copie et collez-la dans la section « Le token en un coup d'œil » ci-dessus.

---

## Étape 7 — Se reconnecter au contrat à tout moment (sans redéployer)

Une fois déployé, votre contrat existe en permanence sur Sepolia. Vous n'avez jamais besoin de le redéployer, il suffit de vous reconnecter :

1. Ouvrez Remix et chargez `YbouzafoToken42.sol`.
2. Compilez-le avec Solidity **0.8.20**.
3. Allez dans **Deploy & Run Transactions**.
4. Sélectionnez **Injected Provider — MetaMask** comme environnement.
5. Connectez le même portefeuille que celui du déploiement, sur **Sepolia**.
6. Sous **Deployed Contracts**, cliquez sur le petit bouton **add (At Address)**.
7. Collez l'adresse de votre contrat.
8. Le contrat se charge, connecté et prêt à l'emploi.

---

## Étape 8 — Voir le token sur Etherscan

1. Allez sur [sepolia.etherscan.io](https://sepolia.etherscan.io).
2. Collez l'adresse de votre contrat dans la barre de recherche.
3. Vous pouvez voir le token, ses transactions et ses détails, le tout publiquement.

---

## Étape 9 — Ajouter YbT42 dans MetaMask

1. Dans MetaMask (Sepolia sélectionné), descendez dans la liste des tokens et cliquez sur **Import tokens**.
2. Collez l'adresse de votre contrat dans **Token contract address**.
3. MetaMask remplit le reste automatiquement :
   - Symbole : `YbT42`
   - Décimales : `18`
4. Cliquez sur **Next**, puis **Import**.
5. Vous devriez maintenant voir **1 000 000 YbT42** dans votre portefeuille.

> ℹ️ Si le solde n'apparaît pas tout de suite, c'est généralement un délai d'affichage de MetaMask. **Remix (`balanceOf`)** et **Sepolia Etherscan** affichent toujours le solde réel.

---

## Étape 10 — Utiliser les fonctions du token

Toutes les actions se font dans Remix sous **Deployed Contracts** → développez votre contrat. Les **boutons bleus** lisent seulement des données (gratuit). Les **boutons orange** envoient une transaction (gas nécessaire, confirmation dans MetaMask).

| Fonction | Type | Entrée | Ce qu'elle fait |
|---|---|---|---|
| `balanceOf` | lecture | adresse du portefeuille | Renvoie le solde de tokens de cette adresse, en wei |
| `totalSupply` | lecture | aucune | Renvoie le total de YbT42 en circulation (diminue après un burn) |
| `owner` | lecture | aucune | Renvoie la seule adresse autorisée à appeler `mint` |
| `mint` | écriture, **propriétaire uniquement** | `to`, `amount` | Crée de nouveaux YbT42 et les envoie à `to` |
| `transfer` | écriture | `to`, `amount` | Envoie des YbT42 à une autre adresse |
| `burn` | écriture | `amount` | Détruit définitivement des YbT42 de votre solde |

**À propos des montants et des décimales**

Le token a 18 décimales, donc les soldes sont renvoyés en wei : 1 000 000 de tokens = `1000000000000000000000000`. Selon la façon dont le contrat est écrit, `amount` dans `mint`, `transfer` et `burn` peut être attendu en tokens entiers (par ex. `500`) ou en wei (par ex. `500000000000000000000` pour 500 tokens). Vérifiez le code du contrat et testez d'abord avec une petite valeur.

---

## Dépannage

| Problème | Solution |
|---|---|
| Sepolia n'est pas dans la liste des réseaux | Activez **Show test networks**, ou ajoutez le réseau manuellement (voir l'étape 2) |
| Je ne peux pas appuyer sur Sepolia dans « Manage networks » | Cet écran sert uniquement à la configuration. Revenez en arrière et utilisez le sélecteur au-dessus de la liste des tokens |
| Le solde affiche 0 SepoliaETH | Demandez des fonds à un faucet et vérifiez que Sepolia est bien le réseau sélectionné |
| Le bouton Deploy ne fait rien ou échoue | Vérifiez que MetaMask est sur Sepolia, que l'environnement est **Injected Provider**, et que vous avez assez de SepoliaETH |
| `mint` échoue | Seul le propriétaire du contrat peut minter. Utilisez le portefeuille qui l'a déployé (vérifiez avec `owner`) |
| Le solde YbT42 n'apparaît pas dans MetaMask | Importez le token (étape 9), puis vérifiez avec `balanceOf` ou Etherscan |

---

## Rappels de sécurité

- Gardez votre phrase secrète de récupération hors ligne et privée.
- Utilisez un **portefeuille séparé pour les tests**, pas celui qui contient de vrais fonds.
- Les tokens de testnet n'ont aucune valeur, mais les bonnes habitudes prises ici serviront sur le mainnet.
