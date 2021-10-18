# FlyingDutchman

## Architecture
The app architecture is based on MVVM (Model-View-ViewModel) pattern. 
When the app launches, initial view is loaded from `AirportListViewController`. This view controller is designed to be dumb, and interact with its view model in order to get data or next actions to perform. When view controller's `viewDidLoad` is called, it notifies its ViewModel via `viewDidLoad` call to perform appropriate action. The view model communicates back to the view using a state observer callback. 

This approach helps in making the ViewModel i.e all the business logic to be tested completely without ever needing to setup a view. 

`AirportListViewModel` upon receiving `viewDidLoad` call, triggers api call to fetch the airport list using `AirportService`. The response is then loaded into memory and passed back to view model, which in turn is used by the view controller in order to render the view. 

## UI Structure
The main view of the app `AirportListViewController` uses a `UITableView` to display the list. Using `UITableViewCell` and it uses defaut title and detail labels.
Tapping on one of the cells from the list, presents the details view `AirportDetailViewController`. This view simply uses a `UIStackView`, that is programmatically populated based on the data being displayed. 

The detail view is presented on top of the main list view, as from the wireframes, there was a back button within the view. So instead of using the UINavigationController stack, I am just presenting over the list view. 

The detail screen displays `Currency`, `TimeZone` and  `Location` as per the wireframes. 

## Network:
The app uses `Routable` and `APIService` protocols to define network access mechanism. 
Idea behind this is that every feature can conform to these and provide their respective concrete implementation. 
As for `Airport List` feature, I am using `AirportListRouter` and `AirportListService`. 

## Note: 
At the moment the response JSON from the api is quite large and is just sitting in the memory after initial load. For this reason I am only parsing the attributes in the entities that are needed. To further reduce the memory footprint this could be saved in some storage (like CoreData  etc) and then retrieved using pagination. 

## Testing Coverage:


## Installation Instructions:
Open `FlyingDutman.xcodeproj` and run the app.

## Improvements:
- error view can be made in line instead of UIAlert
- Handle no network connectivity (caching)
- Detail view screen UI can be improved
