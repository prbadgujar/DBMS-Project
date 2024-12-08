import React from "react";
import ContinentSelection from "./components/ContinentSelection";
import SecondPage from "./components/SecondPage";
import { useRoutes } from "react-router-dom";
import StateSelection from "./components/StateSelection";
import NpInfo from "./components/NpInfo";
import NationalPark from "./components/NationalPark";
import PlacesToGo from "./components/PlacesToGo";
import ThingsTodo from "./components/ThingsTodo";
import SignUp from "./components/SignUp";
import LoginPage from "./components/loginPage";
import DiningAndSleeping from "./components/DiningAndSleeping";

const AppRoutes = () => {
  const routes = useRoutes([
    { path: "/", element: <LoginPage /> },
    { path: "/signUp", element: <SignUp />},
    { path: "/firstPage", element: <ContinentSelection /> },
    { path: "/continent/:continent", element: <SecondPage /> },
    { path: "/country/:country", element: <StateSelection /> },
    { path: "/state/:state", element: <NationalPark /> },
    { path: "/nationalPark/:nationalPark", element: < NpInfo/> },
    { path: "/placesToGo/:nationalPark", element: < PlacesToGo/> },
    { path: "/ThingsTodo/:nationalPark", element: < ThingsTodo/> },
    {path: "/diningandsleeping/:nationalPark", element: < DiningAndSleeping/> },

  ]);
  return routes;
};

const App = () => (
  <div>
    <AppRoutes />
  </div>
);

export default App;