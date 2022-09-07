//
//  QuotesViewController.swift
//  AppPensamentos
//
//  Created by Renato on 06/09/22.
//

import UIKit

class QuotesViewController: UIViewController {

    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var lbQuotes: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //end override func viewDidLoad
    
    //função que diz o oque VAI APARECER NA TELA
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //prepara uma quote
        prepareQuote()
        //toda vez que entrar na tela, formatar a view
        formatView()
        
    } //end override func viewWillAppear
    
    func formatView(){
        //criando um metodo para formatar as views
        //modificar a cor de fundo, schema de cores
        //mudando backgroundColor
        view.backgroundColor = config.colorScheme == 0 //se for igual a zero, então ele está na versão escura
        
    } //end func formatView
    
    //função que ao tocar na tela passa de pensamento
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }

    func prepareQuote() {
        //para que não ocorra de aparecer duas quotes temos que invalidar o tempo anterior
        timer?.invalidate()
        //qual é o tempo que ele vai demorar para executar uma ação
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { (Timer) in
            self.showRandomQuote() //esse metodo só é chamado depois de 8 segundos
        }
        showRandomQuote() //por isso estamos chamando ele aqui também
    }
    func showRandomQuote(){
        //recuprando o pensamento
        let quote = quotesManager.getRandomQuote()
        //definindo os campos
        lbQuotes.text = quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = ivPhoto.image
        
        lbQuotes.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        lcTop.constant = 50
        //reposicionar os elementos
        self.view.layoutIfNeeded()
        
        //fazer aparecer de um jeito animado
        UIView.animate(withDuration: 2.5) {
            self.lbQuotes.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBg.alpha = 0.25
            self.lcTop.constant = 10
            //reposicionar os elementos
            self.view.layoutIfNeeded()
        }
        
    }
} //end class QuotesViewController
