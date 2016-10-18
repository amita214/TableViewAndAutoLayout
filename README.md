# UITableViewCell and Autolayout

With iOS8 autolayout is also available for `UITableViewCell`. No need to manually calculate the height of each cell in `tableView:heightForRowAtIndexPath:`

* Autolayout calculates this for you. But the autolayout is not enabled by default. To enable autolayout, add the following lines:

```swift
self.tableView.rowHeight = UITableViewAutomaticDimension
self.tableView.estimatedRowHeight = 44.0 // some positive value
```

* Also, go to `tableView:cellForRowAtIndexPath:` and add the following additionally:

```swift
cell.textLabel!.numberOfLines = 0
```
And you are done!

Now, what if you want to customize the `UITableViewCell` ? Well, no worries just do the following:

1. Add all the subviews and constraints to the cell's content view.
2. If there are any descendants of `UIScrollView` then do the following:
   ```
   scrollview.scrollEnabled = false
   ```



Happy coding!
