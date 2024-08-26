//
//  CoordinatorProtocol.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import Foundation

// MARK: - CoordinatorProtocol

protocol CoordinatorProtocol: AnyObject {
    
    // MARK: Internal Properties
    
    var children: [CoordinatorProtocol] { get set }
    var router: RouterProtocol { get }
    
    // MARK: Internal Methods
    
    func present(animated: Bool)
    func present(animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
    func presentChild(_ child: CoordinatorProtocol, animated: Bool, onDismissed: (() -> Void)?)
}

// MARK: - Default Implementations

extension CoordinatorProtocol {
    
    // MARK: Internal Methods
    
    func present(animated: Bool) {
        present(animated: animated, onDismissed: nil)
    }
    
    func dismiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
    func presentChild(
        _ child: CoordinatorProtocol,
        animated: Bool,
        onDismissed: (() -> Void)? = nil)
    {
        children.append(child)
        
        child.present(
            animated: animated,
            onDismissed: { [weak self, weak child] in
                guard
                    let self,
                    let child
                else {
                    return
                }
                
                self.removeChild(child)
                onDismissed?()
            })
    }
    
    // MARK: Private Methods
    
    private func removeChild(_ child: CoordinatorProtocol) {
        guard let index = children.firstIndex(
            where: { $0 === child })
        else {
            return
        }
        
        children.remove(at: index)
    }
}
