import React from "react";
import PropTypes from "prop-types";
import Select from "react-select";
import { find } from "lodash";
import { get, post } from "../api";
import FormattedDate from "./FormattedDate";

//Used copilot for help with syntax and structure of the code

function InvestigationNotesEditor({ close, onSave, currentNotes }) {
    const [noteContent, setNoteContent] = React.useState("");

    const handleChange = (event) => {
        setNoteContent(event.target.value);
    };
    return (
        <div>
            <textarea
                value={noteContent}
                onChange={handleChange}
            />
            <button onClick={() => onSave(noteContent)}>Save</button>
            <button onClick={close}>Cancel</button>
        </div>
    );
}
//Used copilot for help with syntax and structure of the code

InvestigationNotesEditor.propTypes = {
    close: PropTypes.func.isRequired,
    onSave: PropTypes.func.isRequired,
    currentNotes: PropTypes.arrayOf(PropTypes.object).isRequired,
};

//Used copilot for help with syntax and structure of the code

function InvestigationNotes({ notes, investigationId }) {
  const [editorOpen, setEditorOpen] = React.useState(false);
  const [currentNotes, setcurrentNotes] = React.useState(notes);

  function onSave(text) {
    post(`/v1/investigations/${investigationId}/notes`, {
      investigation_note: {
        content: text,
      },
    }).then((result) => {
      setEditorOpen(false);
      setcurrentNotes(currentNotes.concat(result));
    });
  }

  const content =
    currentNotes.length === 0 ? (
      <p>This investigation does not yet have notes associated with it.</p>
    ) : (
      <>
        <ul>
          {currentNotes.map((note) => {
            const content = note.data.attributes.content;
            const date = FormattedDate(note.data.attributes.date);
            const officer = note.data.attributes.officer.data.attributes.first_name + " " + note.data.attributes.officer.data.attributes.last_name;
            return (
              <li key={`note-${note.data.id}`}>
                <p>
                    {date}: {content}
                </p>
                <p>
                    - {officer}
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
          <span class="card-title" style={{ fontWeight: 'bold' }}>Investigation Notes</span>
            {content}
            {editorOpen && (
              <InvestigationNotesEditor
                close={() => setEditorOpen(false)}
                onSave={onSave}
              />
            )}
            {!editorOpen && <button onClick={() => setEditorOpen(true)}>Add</button>}

        </div>
      </div>
    </>
  );
}

InvestigationNotes.propTypes = {
    notes: PropTypes.arrayOf(PropTypes.object).isRequired,
    investigationId: PropTypes.number.isRequired,
};

export default InvestigationNotes;
