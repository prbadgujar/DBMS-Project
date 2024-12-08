import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";

const DiningAndSleeping = () => {
  const { nationalPark } = useParams(); // Retrieve the country parameter from the URL
  const [npInfo, setNpInfo] = useState([]); // State to store fetched states
  // const [placesToGo, setPlacesToGo] = useState([]);


  const navigate = useNavigate(); // For navigation if needed
   console.log("np....",nationalPark);
  useEffect(() => {
    console.log(nationalPark);
    if (!nationalPark) {
      alert("No National park info.");
      return;
    }
    // Fetch countries for the selected continent
    // fetch("http://localhost:8080/api/locations/continent")

   fetch(`http://localhost:8080/api/locations/dining/parkId/${nationalPark}`)
      .then((response) => response.json())
      .then((data) => setNpInfo(data))
      .catch((error) => console.error("Error fetching national park info:", error));
  }, [nationalPark]);
    
  const arr = npInfo.map(id =>
    console.log(id.parkingTags));

  // const handleCheckboxChange = (np) => {
  //   setNationalParksState((prev) => (prev === np ? "" : np)); // Toggle selection
  // };

  // Handle form submission
  // const handleSubmit = () => {
  //   if (selectednationalParks.length > 0) {
  //     console.log("Selected countries:", selectednationalParks);
  //     // Perform navigation or other actions here
  //   } else {
  //     alert("Please select a national a park");
  //   }
  // };
// "nationalParkName": "Black Canyon of the Gunnison NP",
//         "weather": "https://www.nps.gov/blca/planyourvisit/weather.htm",
//         "visitors": "200,000",
//         "parkId": 6.0,
//         "closureAndAlerts": "https://www.nps.gov/blca/planyourvisit/conditions.htm",
//         "entranceFee": "$30",
//         "parkingTags": "Yes",
//         "operatingHours": "8 AM - 5 PM",
//         "locId": 6.0,
//         "placeId": 23.0,
//         "placesDescription": "The parks main feature, known for its dramatic cliffs and narrow canyons.",
//         "placesLocation": "https://www.nps.gov/blca/planyourvisit/black-canyon.htm",
//         "placesName": "Black Canyon",
//         "placesType": "Canyon"

const handleSubmit = () => {

  // setNpInfo((prev) => (prev === info ? "" : info)); // Toggle selection
   // navigate(`/diningandsleeping/${nationalPark}`);
    // Perform navigation or other actions here
  }

  return (
   <div className="container">
      <h1>Select a National Park in</h1>
      <div className="checkbox-group">
      {npInfo.map((np) => (
       <div key={np.parkId}>
       <label>
       <ul>
<li>Name: {np.diningandSleepingName}</li>
<li>Type: {np.diningandSleepingType}</li>
<li>Location: {np.diningLocation}</li>
<li>Description: {np.diningandSleepingDescription}</li>
<li>Contact: {np.contactinfo}</li>

</ul>
       </label>
     </div>     
              

          ))}
      </div>
    </div>
  );
};

export default DiningAndSleeping;