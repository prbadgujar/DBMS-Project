import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";

const ContinentSelection = () => {
  const [continents, setContinents] = useState(["America"]); // Store fetched continents
  const [selectedContinent, setSelectedContinent] = useState(""); // Store selected continent
  const navigate = useNavigate();

  // Fetch continents from the server
  useEffect(() => {
    fetch("http://localhost:8080/api/locations/continent")
      .then((response) => response.json())
      .then((data) => setContinents(data || [])) // Ensure fallback to an empty array
      .catch((error) => console.error("Error fetching continents:", error));
  }, []);

  // Handle checkbox selection
  const handleCheckboxChange = (continent) => {
    setSelectedContinent((prev) => (prev === continent ? "" : continent)); // Toggle selection
  };

  


  // Redirect to the countries page
  const redirectToCountriesPage = () => {
    if (selectedContinent) {
console.log("zzzz", selectedContinent);
      navigate(`/continent/${selectedContinent}`);
    } else {
      alert("Please select a continent.");
    }
  };







  return (
    <div className="container">
      <h1>Select a Continent</h1>
      <div className="checkbox-group">
        {continents.map((continent) => (
          <div key={continent}>
            <label>
              <input
                type="checkbox"
                name="continent"
                value={continent}
                checked={selectedContinent === continent}
                onChange={() => handleCheckboxChange(continent)}
              />
              {continent}


              
            </label>
          </div>
        ))}
      </div>
      <button onClick={redirectToCountriesPage}>View Countries</button>
    </div>
    
  );
};

export default ContinentSelection;