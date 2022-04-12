/*JavaScript
Class Code & Name: INFT3000-Capstone
Team Name: MNM Applications
Authors:   Matt Gates, Neil Bunyan, Michael Anthony
*/

/*Function for displaying a result when a user clicks the submit button on
the home page, uses the teranary operator*/

function thankYou(){
    let email = document.getElementById('email').value;
    let location = document.getElementById('location').value;
    let result;
    (email && location) ?
        result = 'Thank you for registering with us! \n You will be notified when a shark passes by the hydrophone':
        result = 'There are missing fields';
    
    window.alert(result);
    
}

function initMap() {
    // Create the map.
     const map = new google.maps.Map(document.getElementById('map'), {
         zoom: 7,
         center: { lat: 44.361906, lng: -64.718456 },
         mapTypeId: 'hybrid'
     });
     new google.maps.Marker({
        position: { lat: 43.920401, lng: -64.146786 },
        map,
        title: "MNM Hydrophone",
      });
 }