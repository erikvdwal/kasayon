# Kasayon

Kasayon, which apparently means _convenience_ in Cuban - is a small collection of protocols and and extensions that aims to make working with table- and collectionviews slightly more enjoyable.

## ReusableView

Both `UITableViewCell` and `UICollectionViewCell` conform to `ReusableView` out of the box and hence expose a static property named `reuseIdentifier`.

```swift
/// ReusableView can be used with any view that is reusable
public protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
```

## NibLoadable

The `NibLoadable` protocol is very similar to the `ReusableView` protocol, but it exposes a static property named `nibName`.

```swift
/// NibLoadable is used with classes that can be loaded via a nib with the same name
public protocol NibLoadable: class {
    static var nibName: String { get }
}

public extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
```

You should make your cell class conform to `NibLoadable` if it comes with an accompanying nib file.

## Cell setup :wrench: 

```swift
// Any UITableViewCell automatically conforms to ReusableView
class SomeTableViewCell: UItableViewCell {}

// If a cell is loaded via a nib, it should conform to NibLoadable as well
class SomeOtherTableViewCell: UItableViewCell, NibLoadable {}
```

### Which reduces this :neutral_face: 
```swift
class ViewController: UIViewController {

    func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(SomeTableViewCell.self, forCellReuseIdentifier: "SomeTableViewCell")
        tableView.register(UINib(nibName: "SomeOtherTableViewCell", bundle: nil), forCellReuseIdentifier: "SomeOtherTableViewCell")
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "SomeTableViewCell", for: indexPath) as! SomeTableViewCell
        cell.configure(thing: thing)

        return cell
    }

}
```

### To just this :raised_hands: 
```swift
class ViewController: UIViewController {

    func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(class: SomeTableViewCell.self)
        tableView.register(class: SomeOtherTableViewCell.self)
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(forIndexPath: indexPath) as SomeTableViewCell
        cell.configure(thing: thing)

        return cell
    }

}
```

### Caveats
- Class name, reuse identifier and nib name must match