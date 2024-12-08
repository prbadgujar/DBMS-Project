import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";

const NationalPark = () => {
  const { state } = useParams(); // Retrieve the country parameter from the URL
  const [nationalParks, setNationalParks] = useState([]); // State to store fetched states
  const [selectednationalParks, setNationalParksState] = useState([]); // State to store selected state
  const [nationalPark, setCheckedItems] = useState([]);

  const navigate = useNavigate(); // For navigation if needed
  console.log("state.",state);
  useEffect(() => {
    console.log(state);
    if (!state) {
      alert("No National park selected.");
      return;
    }


    // Fetch countries for the selected continent
    // fetch("http://localhost:8080/api/locations/continent")

   fetch(`http://localhost:8080/api/locations/state-by-npNameId/${state}`)
      .then((response) => response.json())
      .then((data) => setNationalParks(data))
      .catch((error) => console.error("Error fetching national parks:", error));
  }, [state]);

  //  const handleCheckboxChange = (event) => {
  //   const { name, checked } = event.target;
  //   setCheckedItems((prevCheckedItems) => ({
  //     ...prevCheckedItems,
  //     [name]: checked,
  //   }));
  // };


  const handleCheckboxChange = (np) => {
    console.log(np, 'np');
    setCheckedItems(np.parkId);
    setNationalParksState((prev) => (prev === np.name ? "" : np.name)); // Toggle selection
  };
  
  // Handle checkbox changes
  // const handleCheckboxChange = (country) => {
  //   setSelectedCountries((prevSelected) =>
  //     prevSelected.includes(country)
  //       ? prevSelected.filter((c) => c !== country) // Remove if already selected
  //       : [...prevSelected, country] // Add if not selected
  //   );
  // };

  
//   const redirectToCountriesPage = () => {
//     if (selectedContinent) {
// console.log("zzzz", selectedContinent);
//       navigate(`/continent/${selectedContinent}`);
//     } else {
//       alert("Please select a continent.");
//     }
  // };

  // Handle form submission
  const handleSubmit = () => {
    if (selectednationalParks.length > 0) {
      console.log("Selected parkId:", nationalPark);
      navigate(`/nationalPark/${nationalPark}`);
      // navigate('/page2', { state: { value } });
      // Perform navigation or other actions here
    } else {
      alert("Please select a national a park");
    }
  };


  return (
   <div className="container">
      <h1>Select a National Park in {state}</h1>
      <div className="checkbox-group">
        {nationalParks.length === 0 ? (
          <p>No National Parks found for {nationalParks}.</p>
        ) : (
          nationalParks.map((np) => (
            <div key={np.parkId}>
              <label>
                <input
                  type="checkbox"
                  name="state"
                  value={np.name}
                  checked={selectednationalParks === np.name}
                  onChange={() => handleCheckboxChange(np)}
                />
                {np.name}
              </label>
            </div>
          ))
        )}
      </div>
      <button type="button" onClick={handleSubmit}>
         Search
      </button>
    </div>
  );
};

export default NationalPark;
