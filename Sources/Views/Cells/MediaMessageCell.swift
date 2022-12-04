/*
 MIT License

 Copyright (c) 2017-2019 MessageKit

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

/// A subclass of `MessageContentCell` used to display video and audio messages.
open class MediaMessageCell: MessageContentCell {

    /// The play button view to display on video messages.
    open lazy var playButtonView: PlayButtonView = {
        let playButtonView = PlayButtonView()
        return playButtonView
    }()

    /// The image view display the media content.
    open var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    open var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing   = 4.0
        return stackView
    }()
    
    open var stackViewTop: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing   = 4.0
        return stackView
    }()
    
    open var stackViewBottom: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing   = 4.0
        return stackView
    }()
    
    open var imageViewFirst: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    open var imageViewSecond: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    open var imageViewThird: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    open var imageViewFourth: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: - Methods

    /// Responsible for setting up the constraints of the cell's subviews.
    open func setupConstraints() {
        imageView.fillSuperview()
        stackView.fillSuperview()
        playButtonView.centerInSuperview()
        playButtonView.constraint(equalTo: CGSize(width: 35, height: 35))
    }

    open override func setupSubviews() {
        super.setupSubviews()
        
        //
        messageContainerView.addSubview(imageView)
        messageContainerView.addSubview(playButtonView)
        messageContainerView.addSubview(stackView)
        setupConstraints()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }

    open override func configure(with message: MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
        super.configure(with: message, at: indexPath, and: messagesCollectionView)

        guard let displayDelegate = messagesCollectionView.messagesDisplayDelegate else {
            fatalError(MessageKitError.nilMessagesDisplayDelegate)
        }

        switch message.kind {
        case .photo(let mediaItem):
            let imageUrlsCount = mediaItem.urls?.count ?? 0
            if imageUrlsCount >= 4 {
                imageViewFirst.image = mediaItem.placeholderImage
                imageViewSecond.image =  mediaItem.placeholderImage
                imageViewThird.image =  mediaItem.placeholderImage
                imageViewFourth.image = mediaItem.placeholderImage
                // Added images in stackview
                imageViewFirst.translatesAutoresizingMaskIntoConstraints = false
                imageViewSecond.translatesAutoresizingMaskIntoConstraints = false
                imageViewThird.translatesAutoresizingMaskIntoConstraints = false
                imageViewFourth.translatesAutoresizingMaskIntoConstraints = false
                stackViewTop.translatesAutoresizingMaskIntoConstraints = false
                stackViewBottom.translatesAutoresizingMaskIntoConstraints = false
                stackView.translatesAutoresizingMaskIntoConstraints = false
                imageViewFirst.layer.cornerRadius = 5
                imageViewFirst.clipsToBounds = true
                imageViewSecond.layer.cornerRadius = 5
                imageViewSecond.clipsToBounds = true
                imageViewThird.layer.cornerRadius = 5
                imageViewThird.clipsToBounds = true
                imageViewFourth.layer.cornerRadius = 5
                imageViewFourth.clipsToBounds = true
                stackViewTop.addArrangedSubview(imageViewFirst)
                stackViewTop.addArrangedSubview(imageViewSecond)
                stackViewBottom.addArrangedSubview(imageViewThird)
                stackViewBottom.addArrangedSubview(imageViewFourth)
                stackView.addArrangedSubview(stackViewTop)
                stackView.addArrangedSubview(stackViewBottom)
                let width = (messageContainerView.frame.width - 4) / 2
            //    stackView.trailingAnchor.constraint(equalTo: messageContainerView.trailingAnchor, constant: 5).isActive = true
            //    stackView.leadingAnchor.constraint(equalTo: messageContainerView.leadingAnchor, constant: 5).isActive = true
            //    stackView.topAnchor.constraint(equalTo: messageContainerView.topAnchor, constant: 5).isActive = true
              //  stackView.bottomAnchor.constraint(equalTo: messageContainerView.bottomAnchor, constant: 5).isActive = true
                imageViewFirst.heightAnchor.constraint(equalToConstant: width).isActive = true
                imageViewFirst.widthAnchor.constraint(equalToConstant: width).isActive = true
                imageViewSecond.heightAnchor.constraint(equalToConstant: width).isActive = true
                imageViewSecond.widthAnchor.constraint(equalToConstant: width).isActive = true
                imageViewThird.heightAnchor.constraint(equalToConstant: width).isActive = true
                imageViewThird.widthAnchor.constraint(equalToConstant: width).isActive = true
                imageViewFourth.heightAnchor.constraint(equalToConstant: width).isActive = true
                imageViewFourth.widthAnchor.constraint(equalToConstant: width).isActive = true
                imageView.isHidden = true
                stackView.isHidden = false
                playButtonView.isHidden = true
                displayDelegate.configureMediaMessageMultipleImageView(imageViewFirst, imageViewSecond, imageViewThird, imageViewFourth, for: message, at: indexPath, in: messagesCollectionView)
            }
            else {
                imageView.isHidden = false
                imageView.image = mediaItem.image ?? mediaItem.placeholderImage
                imageView.fillSuperview()
                stackView.isHidden = true
                playButtonView.isHidden = true
            }
        case .video(let mediaItem):
            imageView.image = mediaItem.image ?? mediaItem.placeholderImage
            playButtonView.isHidden = false
            stackView.isHidden = true
        default:
            break
        }

        displayDelegate.configureMediaMessageImageView(imageView, for: message, at: indexPath, in: messagesCollectionView)
    }
    
    /// Handle tap gesture on contentView and its subviews.
    open override func handleTapGesture(_ gesture: UIGestureRecognizer) {
        let touchLocation = gesture.location(in: imageView)

        guard imageView.frame.contains(touchLocation) else {
            super.handleTapGesture(gesture)
            return
        }
        delegate?.didTapImage(in: self)
    }
    
}
