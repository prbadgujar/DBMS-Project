import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";

const CountriesByContinent = () => {
  const { continent } = useParams(); // Retrieve the continent parameter from the URL
  const [countries, setCountries] = useState([]); // State to store fetched countries
  const [selectedCountries, setSelectedCountries] = useState([]); // State to store selected countries
  const navigate = useNavigate(); // For navigation if needed

  useEffect(() => {
    if (!continent) {
      alert("No continent selected.");
      return;
    }

    // Fetch countries for the selected continent
    // fetch("http://localhost:8080/api/locations/continent")

   fetch(`http://localhost:8080/api/locations/countries-by-continent/${continent}`)
      .then((response) => response.json())
      .then((data) => setCountries(data))
      .catch((error) => console.error("Error fetching countries:", error));
  }, [continent]);

  // // Handle checkbox changes
  // const handleCheckboxChange = (country) => {
  //   setSelectedCountries((prevSelected) =>
  //     prevSelected.includes(country)
  //       ? prevSelected.filter((c) => c !== country) // Remove if already selected
  //       : [...prevSelected, country] // Add if not selected
  //   );
  // };

  const handleCheckboxChange = (country) => {
    setSelectedCountries((prev) => (prev === country ? "" : country)); // Toggle selection
  };

  // Handle form submission
  const handleSubmit = () => {
    if (selectedCountries.length > 0) {
      console.log("Selected countries:", selectedCountries);
      navigate(`/country/${selectedCountries}`);
      // Perform navigation or other actions here
    } else {
      alert("Please select at least one country.");
    }
  };

//   const redirectToStateSlectionPage = () => {
//     if (selectedCountries) {
// console.log("zzzz", selectedCountries);
//       navigate(`/country/${selectedCountries}`);
//     } else {
//       alert("Please select atleast one country.");
//     }
//   };

const back = () => {
    console.log("Selected countries:", selectedCountries);
    navigate(`/firstPage`);    // Perform navigation or other actions here
};


  return (
    <div className="container">
      <h1>Select a Country in {continent}</h1>
      <div className="checkbox-group">
        {countries.length === 0 ? (
          <p>No countries found for {continent}.</p>
        ) : (
          countries.map((country) => (
            <div key={country}>
              <label>
                <input
                  type="checkbox"
                  name="country"
                  value={country}
                  checked={selectedCountries === country}
                  onChange={() => handleCheckboxChange(country)}
                />
                {country}
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

export default CountriesByContinent;