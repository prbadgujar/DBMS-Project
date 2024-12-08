import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const LoginPage = () => {
    const navigate = useNavigate();

  // State to store form data
  const [formData, setFormData] = useState({
    username: "",
    password: "",
  });

  // State to store errors
  const [errors, setErrors] = useState({});

  // Handle form input changes
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  // Basic form validation
  const validateForm = () => {
    let formErrors = {};
    let formIsValid = true;

    // Validate each field
    if (!formData.username) {
      formErrors.username = "Username is required";
      formIsValid = false;
    }

    if (!formData.password) {
        formErrors.password = "Password is required";
        formIsValid = false;
      }
  
    setErrors(formErrors);
    return formIsValid;
  };

  // Handle form submission
//   const handleSubmit = (e) => {
//     e.preventDefault();

//     // Validate the form before submission
//     if (validateForm()) {
//       console.log("Form submitted successfully:", formData);
//       navigate(`/firstPage`);
//       // Here you would typically send the data to an API endpoint
//     }
//   };

const handleSubmit = async (event) => {
  event.preventDefault(); // Prevent default form behavior

  if (!validateForm()) {
    setFormData((prevValue) => {
      return {
        ...prevValue, 
        username: "",
     password: ""
      };
    }); return; // Exit if validation fails
  }

  try {
    const response = await axios.post("http://localhost:8080/demo/verify", {
      username: formData.username,
      password: formData.password,
    });

    if (response.status === 200) {

      console.log({response});
      const userId = response.data.id; // Replace with actual API key
      if (userId) {
        localStorage.setItem("user_id", userId);
        alert("Login successfully!");
        navigate("/firstPage");
      } else {
        alert("Login failed. User ID not found in response.");
      }
    } else {
      alert("Failed to login. Please check your credentials.");
    }
  } catch (error) {
    console.error("Error during login:", error);
    alert("Login failed. Please try again.");
  }
};

 const signUp = (e) => {
    e.preventDefault();

    // Validate the form before submission
      console.log("Form submitted successfully:", formData);
      navigate(`/signUp`);
      // Here you would typically send the data to an API endpoint
  };

  return (
    
<div>
  
<h1 className="main-heading">National Park</h1>

    <div className="login-container">
       {/* <h1 className="main-heading">National Park</h1> */}
      {/* <h1 style={{ fontSize: "4rem", color: "black", textAlign: "center", padding:0}}>
        National Park
      </h1> */}
      <h2>Login Form</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="username">Username</label>
          <input
            type="text"
            id="username"
            name="username"
            value={formData.username}
            onChange={handleChange}
            required
          />
          {errors.username && <p className="error">{errors.username}</p>}
        </div>

        <div className="form-group">
          <label htmlFor="password">Password</label>
          <input
            type="password"
            id="password"
            name="password"
            value={formData.password}
            onChange={handleChange}
            required
          />
          {errors.password && <p className="error">{errors.password}</p>}
        </div>
            <button type="submit">Login</button>
         {/* className="button-container" */}
             <button onClick={signUp}>Sign Up</button>
      </form>
    
    </div>
    </div>
  );
};

export default LoginPage;
