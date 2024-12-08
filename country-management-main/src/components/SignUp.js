import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const SignUp = () => {
    const navigate = useNavigate();

  // State to store form data
  const [formData, setFormData] = useState({
    email: "",
    contact: "",
    first_name: "",
    last_name: "",
    password: "",
    username: "",
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
    if (!formData.email) {
      formErrors.email = "Email is required";
      formIsValid = false;
    }

    if (!formData.password) {
      formErrors.password = "Password is required";
      formIsValid = false;
    }

    if (!formData.contact) {
      formErrors.contact = "Contact number is required";
      formIsValid = false;
    }

    if (!formData.first_name) {
      formErrors.first_name = "First Name is required";
      formIsValid = false;
    }

    if (!formData.last_name) {
      formErrors.last_name = "Last Name is required";
      formIsValid = false;
    }

    if (!formData.username) {
      formErrors.username = "Username is required";
      formIsValid = false;
    }

    setErrors(formErrors);
    return formIsValid;
  };

  // Handle form submission
  // const handleSubmit = (e) => {
  //   e.preventDefault();

  //   // Validate the form before submission
  //   if (validateForm()) {
  //     console.log("Form submitted successfully:", formData);
  //     navigate(`/firstPage`);
  //     // Here you would typically send the data to an API endpoint
  //   }
  // };

  const handleSubmit = (event) => {
    event.preventDefault(); // Prevent default form behavior
    if (formData) {
      console.log(formData, 'formData');
      // Make the API request to update the user's comment in the backend

      axios.post("http://localhost:8080/demo/signup", {
      ...formData
      
      })
        .then((response) => {
          if (response.status === 200) {
            alert("SignUp successfully!");
            navigate("/"); // Navigate to the desired page
          } else {
            alert("Failed to SignIn. Please check your credentials.");
          }
        
        })
        .catch((error) => {
          console.error('Error submitting comment:', error);
          alert('Error submitting comment.');
        });
        if (validateForm()) {
          console.log("Form submitted successfully:", formData);
        //  navigate(`/firstPage`);
          // Here you would typically send the data to an API endpoint
        }
    } else {
      alert('Please enter a valid comment.');
    }
  }

  return (
    <div class="signImg">
    <div className="login-container">
      <h2>SignUp Form</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="email">Email</label>
          <input
            type="email"
            id="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
            required
          />
          {errors.email && <p className="error">{errors.email}</p>}
        </div>

        <div className="form-group">
          <label htmlFor="contact">Contact</label>
          <input
            type="text"
            id="contact"
            name="contact"
            value={formData.contact}
            onChange={handleChange}
            required
          />
          {errors.contact && <p className="error">{errors.contact}</p>}
        </div>

        <div className="form-group">
          <label htmlFor="first_name">First Name</label>
          <input
            type="text"
            id="first_name"
            name="first_name"
            value={formData.first_name}
            onChange={handleChange}
            required
          />
          {errors.first_name && <p className="error">{errors.first_name}</p>}
        </div>

        <div className="form-group">
          <label htmlFor="last_name">Last Name</label>
          <input
            type="text"
            id="last_name"
            name="last_name"
            value={formData.last_name}
            onChange={handleChange}
            required
          />
          {errors.last_name && <p className="error">{errors.last_name}</p>}
        </div>

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

        <button type="submit">Sign Up</button>
      </form>
    </div>
    </div>
  );
};

export default SignUp;
