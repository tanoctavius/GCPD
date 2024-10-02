import React from "react";
import PropTypes from "prop-types";
import Select from "react-select";
import { find } from "lodash";
import { get, post } from "../api";

function CrimeEditor({ close, onSave, currentCrimes }) {
  const [options, setOptions] = React.useState([]);
  const [crimeId, setCrimeId] = React.useState();

  React.useEffect(() => {
    get(`/v1/crimes`).then((response) => {
      setOptions(
        response.crimes.map((crime) => {
          const crimeAlreadyExists = !!find(currentCrimes, {
            data: { id: crime.data.id },
          });
          const { name, felony } = crime.data.attributes;
          return {
            value: crime.data.id,
            label: `${name} (${felony ? "felony" : "misdemeanor"})`,
            disabled: crimeAlreadyExists,
          };
        })
      );
    });
  }, []);

  return (
    <>
      <Select
        options={options}
        onChange={({ value }) => setCrimeId(value)}
        isOptionDisabled={(option) => option.disabled}
      />
      <button onClick={() => onSave(crimeId)} disabled={!crimeId}>
        Save
      </button>{" "}
      <button onClick={close}>Cancel</button>
    </>
  );
}

//Used copilot for help with syntax and structure of the code

CrimeEditor.propTypes = {
  close: PropTypes.func.isRequired,
  onSave: PropTypes.func.isRequired,
  currentCrimes: PropTypes.arrayOf(PropTypes.object).isRequired,
};

function Crimes({ crimes, investigationId }) {
  const [editorOpen, setEditorOpen] = React.useState(false);
  const [currentCrimes, setCurrentCrimes] = React.useState(crimes);

  function onSave(crimeId) {
    post(`/v1/investigations/${investigationId}/crime_investigations`, {
      crime_investigation: {
        crime_id: crimeId,
      },
    }).then((result) => {
      setEditorOpen(false);
      setCurrentCrimes([result].concat(currentCrimes));
    });
  }

  const content =
    currentCrimes.length === 0 ? (
      <p>This investigation does not yet have crimes associated with it.</p>
    ) : (
      <>
        <ul>
          {currentCrimes.map((crime) => {
            const { name, felony } = crime.data.attributes;
            return (
              <li key={`crime-${crime.data.id}`}>
                <p>
                  - {name} {felony ? "(felony)" : "(misdemeanor)"}
                </p>
              </li>
            );
          })}
        </ul>
      </>
    );

  return (
    <>
      <div class="card blue lighten-5">
        <div class="card-content">
          <span class="card-title" style={{ fontWeight: 'bold' }}>Crimes</span>
            {content}
            {editorOpen && (
              <CrimeEditor
                close={() => setEditorOpen(false)}
                onSave={onSave}
                currentCrimes={currentCrimes}
              />
            )}
            {!editorOpen && <button onClick={() => setEditorOpen(true)}>Add</button>}

        </div>
      </div>
    </>
  );
}

Crimes.propTypes = {
  crimes: PropTypes.arrayOf(PropTypes.object).isRequired,
  investigationId: PropTypes.string.isRequired,
};

export default Crimes;