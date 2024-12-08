import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
const NpInfo = () => {
  const { nationalPark } = useParams(); // Retrieve the country parameter from the URL
  const [npInfo, setNpInfo] = useState([]); // State to store fetched states
  // const [placesToGo, setPlacesToGo] = useState([]);
  const [inputValue, setInputValue] =  useState('');


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

   fetch(`http://localhost:8080/api/locations/parkId/${nationalPark}`)
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
    navigate(`/placesToGo/${nationalPark}`);
    // Perform navigation or other actions here
  }

  const handleSubmit1 = () => {

    // setNpInfo((prev) => (prev === info ? "" : info)); // Toggle selection
    
      navigate(`/ThingsTodo/${nationalPark}`);
      // Perform navigation or other actions here
    }

    const handleSubmit2 = () => {

      // setNpInfo((prev) => (prev === info ? "" : info)); // Toggle selection
        navigate(`/diningandsleeping/${nationalPark}`);
        // Perform navigation or other actions here
      }


  const formHandleChange = (event) => {
      setInputValue(event.target.value);
  }

  // const handleFormSubmission = (event) => {
  //       event.preventDefault();
  //       setInputValue(event.target.value);

  // }
  // console.log(inputValue);


//Comment userId function
const getUserId = () => {
  return localStorage.getItem("user_id");
};

  const handleFormSubmission = (event) => {
    event.preventDefault(); // Prevent default form behavior

    if (inputValue.trim()) {
      console.log(inputValue, 'inputValue');
      // Make the API request to update the user's comment in the backend
      // fetch(`http://localhost:8080/api/comments`, {
      //   method: 'POST',
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: { comment: inputValue, park_id: nationalPark }

      // })
      axios.post("http://localhost:8080/api/comments", {
        //..formData

        comment: inputValue, park_id: nationalPark, user_id: getUserId()
        })

        .then((response) => {
          if (response.status === 200) {

        //  if (response.ok) {
            alert('Comment updated successfully!');
          } else {
            alert('Failed to update comment.');
          }
        })
        .catch((error) => {
          console.error('Error submitting comment:', error);
          alert('Error submitting comment.');
        });
    } else {
      alert('Please enter a valid comment.');
    }
  }









const name = npInfo[0]?.weather;
  console.log("npInfo.....",npInfo[0]);
  console.log(name);
  return (
   <div className="container">
      <h1>Select a National Park in</h1>
      <div className="checkbox-group">
                 <label>
       <ul>
<li>Name: {npInfo[0]?.nationalParkName}</li>
<li>Number of Visitors: {npInfo[0]?.visitors}</li> 
 <li>Entrance Fee: {npInfo[0]?.entranceFee}</li>
<li>Operating Hours: {npInfo[0]?.operatingHours}</li>
<li>Parking Tags Needed: {npInfo[0]?.parkingTags}</li>
<li>
  <a href={npInfo[0]?.closureAndAlerts} target="_blank">Closure And Alerts
    </a></li>

<li>
  <a href={npInfo[0]?.weather} target="_blank">Weather
    </a></li> 
</ul>
       </label>


      </div>
      <button type="button" onClick={handleSubmit}>
         Places to Go
      </button>
      <button type="button" onClick={handleSubmit1}>
        Things to do
      </button>
      <button type="button" onClick={handleSubmit2}>
        Dining and Sleeping
      </button>
      <form onSubmit={handleFormSubmission}>
        <div>
          <label>Comment:</label>
          <input className="textInput"
          type="text"
          value={inputValue}
          onChange={formHandleChange}
          placeholder="Enter Comments"
           />
           <p>You typed: {inputValue}</p>
        </div>
         <button type="submit">
        Submit
      </button>
      </form>
    </div>
  );
};

export default NpInfo;