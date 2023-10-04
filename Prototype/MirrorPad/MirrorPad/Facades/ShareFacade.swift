import UIKit

public class ShareFacade {
  // MARK: - Instance Properties
  // 1
  public unowned var entireDrawing: UIView
  public unowned var inputDrawing: UIView
  public unowned var parentViewController: UIViewController
  // 2
  private var imageRenderer = ImageRenderer()
  // MARK: - Object Lifecycle
  // 3
  public init(entireDrawing: UIView,
              inputDrawing: UIView,
              parentViewController: UIViewController) {
    self.entireDrawing = entireDrawing
    self.inputDrawing = inputDrawing
    self.parentViewController = parentViewController
  }
  // MARK: - Facade Methods
  // 4
  public func presentShareController() {
    
    // 1
    let selectionViewController =
      DrawingSelectionViewController.createInstance(
        entireDrawing: entireDrawing,
        inputDrawing: inputDrawing,
        delegate: self)
    // 2
    parentViewController.present(selectionViewController,
                                 animated: true)
    
  }
  
}

// MARK: - DrawingSelectionViewControllerDelegate
extension ShareFacade: DrawingSelectionViewControllerDelegate {
  
  // 1
  public func drawingSelectionViewControllerDidCancel(
    _ viewController: DrawingSelectionViewController) {
    parentViewController.dismiss(animated: true)
  }
  
  // 2
  public func drawingSelectionViewController(
    _ viewController: DrawingSelectionViewController,
    didSelectView view: UIView) {
    
    parentViewController.dismiss(animated: false)
    let image = imageRenderer.convertViewToImage(view)
    let activityViewController = UIActivityViewController(
      activityItems: [image],
      applicationActivities: nil)
    parentViewController.present(activityViewController,
                                 animated: true)
  }
  
}
