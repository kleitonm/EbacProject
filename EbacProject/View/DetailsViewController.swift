//
//  DetailsViewController.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 18/04/23.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    private var movie: Movie
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        setLayout()
        confighierarchy()
        configConstraints()
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20.0)
        label.textAlignment = .center
        return label
    }()
    
    private let imagePoster: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 32.0
        image.layer.masksToBounds = true
        image.backgroundColor = .blue
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let subTitlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 10
        label.textAlignment = .center
        return label
    }()
    
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        guard let imageURL = movie.image else { return }
        configureImage(imageURL)
        getDetails()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    private func configureImage(_ imageURL: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)")
        imagePoster.kf.setImage(with: url)
    }
    
    private func getDetails() {
        titleLabel.text = movie.title
        subTitlelabel.text = "Classificação dos usuários: \(movie.voteAverage)"
        descriptionLabel.attributedText = NSAttributedString(string: movie.overview).withLineSpacing(8.0)
    }
    
    
    private func confighierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(imagePoster)
        view.addSubview(subTitlelabel)
        view.addSubview(descriptionLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            imagePoster.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            imagePoster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePoster.widthAnchor.constraint(equalToConstant: 192),
            imagePoster.heightAnchor.constraint(equalToConstant: 264),
            
            subTitlelabel.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 32.0),
            subTitlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: subTitlelabel.bottomAnchor, constant: 32.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
        ])
    }
    
}
