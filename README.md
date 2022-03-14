# DialysisNow

Dialysis is a critical treatment for patients with declining kidney functionality. However, it can be difficult
to locate dialysis centers and/or assess the availability of that center for treatment, especially in times of crisis 
(such as during natural disasters). 
DialysisNow is an application that aims to provide a central database of
dialysis centers within the United States.
The application will provide navigational components, as well as give
users the capability to report closures of certain dialysis centers
during times of crisis. This will allow other users to avoid wasting
valuable time searching a multitude of centers to find treatment.

## Release Notes for Version 0.3.0

### Version 0.3.0
#### New Features:
* Implementation of a functional navigation bar so that users can easily access the different screens of the application.

* Interactive map marker which allows for quicker accessibility of a dialysis center's information.

#### Bug Fixes
* Fixed map marker bug which repeatedly rendered old map markers, which can cause clutter on screen view

* Fixed search and filtering when looking for particular dialysis centers

#### Known Issues
* MongoDB database and Flutter integration issue involving pub being unable to resolve dependency constraints due to varying package dependencies

##

### Version 0.2.0
#### New Features:
* Map view to displayer dialysis center within a map screen.

* A user is able to search for dialysis care centers by name or address keywords which yields a list view of resulting dialysis care centers.

* The map marker is first set to the user's location and then set to the chosen dialysis care center.

* The map marker can be clicked for the info screen for the center's information.

#### Bug Fixes
* Crowding on map screen

#### Known Issues
* N/A

##

### Version 0.1.0
#### New Features:
* Linked the Google Places API to the application to provide
  navigational services and features.

* Has the capability to show information about a particular
  dialysis center, such as their address and opening hours.

* Linked the call functionality so that users are able to contact
  their selected dialysis center.

#### Bug Fixes
* N/A

#### Known Issues
* N/A
