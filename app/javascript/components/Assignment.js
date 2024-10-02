import React from "react";
import FormattedDate from "./FormattedDate";

// Current Assignments: 
// There will be a card/panel showing the assignment of officers who are currently working on the investigation. 
// This list will have the rank and name of the officer as well as the date the officer was assigned to the case. 
// If there are no officers currently assigned to the investigation, a note to that effect should appear. 

function Assignment ({investigation}) {
    const investigationData = investigation.data.attributes;
    const assignments = investigationData.current_assignments;
    console.log(investigation);
    var officer_first_names = [];
    var officer_last_names = [];
    var officer_ranks = [];
    var start_dates = [];
    assignments.forEach(assignment => {
        officer_first_names.push(assignment.data.attributes.officer.data.attributes.first_name);
        officer_last_names.push(assignment.data.attributes.officer.data.attributes.last_name);
        officer_ranks.push(assignment.data.attributes.officer.data.attributes.rank);
        start_dates.push(assignment.data.attributes.start_date);
    });
     
    return (
        <>
            <div class="card blue lighten-5">
                <div class="card-content">
                    <span class="card-title" style={{ fontWeight: 'bold' }}>Current Assignments</span>
                    {assignments.length === 0 ? (
                        <p>There are no officers currently assigned to this investigation.</p>
                    ) : (
                        <>
                            <ul>
                                {assignments.map((assignment, index) => {
                                    return (
                                        <li key={`assignment-${assignment.data.id}`}>
                                            <p>
                                                <ul>
                                                    <li>&bull; {officer_ranks[index]} {officer_first_names[index]} {officer_last_names[index]} (as of: {FormattedDate(start_dates[index])})</li>
                                                </ul>
                                            </p>
                                        </li>
                                    );
                                })}
                            </ul>
                        </>
                    )}

                </div>
            </div>
        </>
    );
}

export default Assignment;