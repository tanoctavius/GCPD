import React from "react";

// a simple function to format a date string into MM/DD/YY format
function FormattedDate(dateString) {
  const date = new Date(dateString);
  const year = date.toLocaleString("en-US", { year: "2-digit" });
  const month = date.toLocaleString("en-US", { month: "2-digit" });
  const day = date.toLocaleString("en-US", { day: "2-digit" });
  
  return (
    <span>
      {month}/{day}/{year}
    </span>
  );
}

export default FormattedDate;