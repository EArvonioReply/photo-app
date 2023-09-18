# photo-app

Lo scopo di questo repo è quello di creare un'app che abbia queste caratteristiche:

- Una Tab Bar con due elementi:
  1. [Photos](#photos)
  2. [Stats](#stats)
- Utilizzi una UITableView nella schermata di Photos
- Devono essere usati questi pattern:
  1. Delegate Pattern
  2. MVVM Pattern
  3. Coordinator Pattern
- Bisogna utilizzare le API di [Flickr](https://www.flickr.com/services/api/) o di [Unsplash](https://unsplash.com/developers) per recuperare delle immagini da mostrare
- Bisogna usare i pod di [Alamofire](https://github.com/Alamofire/Alamofire) per gestire le chiamate alle API e [Kingfisher](https://github.com/onevcat/Kingfisher) per gestire il download asincrono delle immagini
- Bisogna utilizzare solo file xib. Non dovranno essere presenti file storyboad nel progetto tranne, al massimo, quello usato per l'app launch.

# Tab Bar

### Photos

Questa sezione deve contenere una UITableView che mostri una lista di immagini casuali. Ogni cella, oltre a mostrare la foto, deve contenere anche due bottoni. Un bottone per il like e uno per il dislike. I due bottini sono mutualmente esclusivi quindi se viene premuto sul like, viene annullato il dislike e viceversa. La grafica può essere a piacere.

### Stats

Questa sezione contiene un resoconto di quanto successo in app. Contiene un contatore che tiene traccia di quante immagini al momento sono visibili. Un contatore di quante immagini hanno un like e quante immagini hanno un dislike.

# UITableView

Per andare un pò più veloce è possibile visionare un pò questa [guida](https://www.kodeco.com/21959913-uicollectionview-tutorial-headers-selection-and-reordering) che da dei suggerimenti. Ovviamente questo è un suggerimento quindi non aspetto di trovare pezzi di codice copiati e incollati in questo progetto.

# Design Patterns

[Delegate Pattern](https://www.youtube.com/watch?v=qiOKO8ta1n4&t=1s)

[MVVM Pattern](https://medium.com/@abhilash.mathur1891/mvvm-in-ios-swift-aa1448a66fb4)

[Coordinator Pattern](https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps)

# Conclusioni

Il progetto va sviluppato seguendo le regole del gitflow quindi andranno creati i vari branch per le varie feature. Ogni volta che una feature termina allora andrà fatto il merge su develop. Sul main andranno fatte solo le PR. Mi aspetto una PR al giorno, fatta a fine giornata, con l'app priva di errori e che mostri lo stato attuale dell'app.
L'app deve essere completa entro 3 giorni. Termine ultimo Giovedi 21/09/2023 a pranzo.
È consigliato l'utillizzo di commenti e di `MARK` per rendere il codice più leggibile e chiaro.
