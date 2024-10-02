import React from "react";
import FormattedDate from "./FormattedDate";
import Select from "react-select";
import PropTypes from "prop-types";
import { find } from "lodash";
import {post, get, put} from "../api";


//Used copilot for help with syntax and structure of the code
function SuspectEditor({close, onSave, currentSuspects}) {
  const [options, setOptions] = React.useState([]);
  const [criminalId, setCriminalId] = React.useState();

  React.useEffect(() => {
  get('/v1/criminals').then((response) => {
      setOptions(
          response.criminals.map((criminal) => {
              const criminalAlreadyExists = 
                  !!find(currentSuspects, 
                  {
                      data: { attributes: {criminal: { data: {id: criminal.data.id}}}},
                  });
              return {
                  value: criminal.data.id,
                  label: `${criminal.data.attributes.first_name} ${criminal.data.attributes.last_name}`,
                  disabled: criminalAlreadyExists,
              };
          })
        );
    });
  }, []);

  return (
      <>
          <Select
              options={options}
              onChange={({ value }) => setCriminalId(value)}
              isOptionDisabled={(option) => option.disabled}
          />
          <button onClick={() => onSave(criminalId)} disabled={!criminalId}>
              Save
          </button>{" "}
          <button onClick={close}>Cancel</button>
      </>
  );
}

//Used copilot for help with syntax and structure of the code

SuspectEditor.propTypes = {
    close: PropTypes.func.isRequired,
    onSave: PropTypes.func.isRequired,
    currentSuspects: PropTypes.arrayOf(PropTypes.object).isRequired,
};

function Suspects({ suspects, investigationId }) {
    const [editorOpen, setEditorOpen] = React.useState(false);
    const [currentSuspects, setCurrentSuspects] = React.useState(suspects);

    function onSave(criminalId) {
        post(`/v1/investigations/${investigationId}/suspects`, {
            suspect: {
                criminal_id: criminalId,
            },
        }).then((result) => {
            setEditorOpen(false);
            setCurrentSuspects([result].concat(currentSuspects));
        });
    }

    //Used copilot for help with syntax and structure of the code

    function drop(criminalId) {
        put(`/v1/drop_suspect/${criminalId}`).then((result) => {
            const index = currentSuspects.findIndex(suspect => suspect.data.id === criminalId);
            const updated = currentSuspects.map((suspect, suspect_index) => {
                if (suspect_index === index ) {
                    return result;
                }
                else {
                    return suspect;
                }
            })
            setCurrentSuspects(updated);
        })
    }

    //Used copilot for help with syntax and structure of the code

    const content = 
        currentSuspects.length === 0 ? (
        <p>This investigation does not yet have suspects associated with it.</p>
        ) : (
            <>
                <ul>
                    {currentSuspects.map((suspect, index) => {
                        const suspectData = suspect.data.attributes;
                        const first_name = suspectData.criminal.data.attributes.first_name;
                        const last_name = suspectData.criminal.data.attributes.last_name;
                        const added_on = FormattedDate(suspectData.added_on);
                        const dropped_on = suspectData.dropped_on === null ? (
                            <span>N/A</span>
                        ) : (
                            FormattedDate(suspectData.dropped_on))
                        return (
                            <li key={index}>
                                <span>{first_name} {last_name}</span>
                                <br />
                                <ul>
                                    <li key={index}> &bull; Added: {added_on}</li>
                                    <li key={index}> &bull;
                                        Dropped: {dropped_on}&nbsp;&nbsp;
                                        {suspectData.dropped_on === null &&
                                            <button onClick={() => drop (suspect.data.id)}>Drop</button>}
                                    </li>
                                </ul>
                            </li>
                        )
                    })}
                </ul>
            </>
        );

    return (
        <>
            <div className="card blue lighten-5">
                <div className="card-content">
                    <span className="card-title">Suspects</span>
                    {content}
                    {editorOpen && (
                        <SuspectEditor
                            close={() => setEditorOpen(false)}
                            onSave={onSave}
                            currentSuspects={currentSuspects}
                        />
                    )}
                    <hr></hr>
                    {!editorOpen && <button onClick={() => setEditorOpen(true)}>Add</button>}
                </div>
            </div>
        </>
    );
}

Suspects.propTypes = {
    suspects: PropTypes.arrayOf(PropTypes.object).isRequired,
    investigationId: PropTypes.string.isRequired
};

export default Suspects;

