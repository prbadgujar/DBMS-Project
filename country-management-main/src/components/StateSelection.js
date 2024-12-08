import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";

const StateSelection = () => {
  const { country } = useParams(); // Retrieve the country parameter from the URL
  const [states, setStates] = useState([]); // State to store fetched states
  const [selectedState, setSelectedState] = useState([]); // State to store selected state
  const navigate = useNavigate(); // For navigation if needed

  useEffect(() => {
    console.log("country..",country);
    if (!country) {
      alert("No State selected.");
      return;
    }

    // Fetch countries for the selected continent
    // fetch("http://localhost:8080/api/locations/continent")

   fetch(`http://localhost:8080/api/locations/state-by-country/${country}`)
      .then((response) => response.json())
      .then((data) => setStates(data))
      .catch((error) => console.error("Error fetching countries:", error));
  }, [country]);


  const handleCheckboxChange = (state) => {
    setSelectedState((prev) => (prev === state ? "" : state)); // Toggle selection
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
  // const handleSubmit = () => {
  //   if (selectedCountries.length > 0) {
  //     console.log("Selected countries:", selectedCountries);
  //     // Perform navigation or other actions here
  //   } else {
  //     alert("Please select at least one country.");
  //   }
  // };

  const handleSubmit = () => {
    if (selectedState.length > 0) {
      console.log("Selected state:", selectedState);
      navigate(`/state/${selectedState}`);
      // Perform navigation or other actions here
    } else {
      alert("Please select a state.");
    }
  };


  const back = () => {
    console.log("Selected states:");
   // navigate(`/country/${selectedCountries}`);    // Perform navigation or other actions here
};

  return (
   <div className="container">
      <h1>Select a State in {country}</h1>
      <div className="checkbox-group">
        {states.length === 0 ? (
          <p>No states found for {country}.</p>
        ) : (

          [...states].sort((a, b) => a.localeCompare(b)).map((state) => (
          //   <div key={state}>
          
          // states.map((state) => (
            <div key={state}>
              <label>
                <input
                  type="checkbox"
                  name="country"
                  value={state}
                  checked={selectedState === state}
                  onChange={() => handleCheckboxChange(state)}
                />
                {state}
              </label>
            </div>
          ))
        )}
      </div>
      <button type="button" onClick={handleSubmit}>
        Search
      </button>
      <button type="button" onClick={back}>
        Back
      </button>
    
    </div>
  );
};

export default StateSelection;