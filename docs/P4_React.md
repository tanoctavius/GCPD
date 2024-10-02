# Dynamic Investigation Pages with React

## Starting Up

We have already set up the code with many of the things needed to build React components and to make sure you are off to a good start, we've provided several components right out of the box. To get these components up and working, you will need to do the following:

- If you have done so already (_most students should have already done this_), install yarn with the command `npm install --global yarn`. Verify it's installed with the command `yarn -v`

- Run `bundle install` and then `rails db:populate` to get the react-rails gem and create and populate the database.

- Now use Yarn to install the React packages with `yarn install` (_note: this is not the same as the first step of_ `npm install yarn`. _In the first case, we were install yarn as a package; in this step we are using the yarn package to install React libraries._)

- Start rails and react with `rails s; yarn start` and then go to [http://localhost:3000/investigations/2](http://localhost:3000/investigations/2) to see an initial page set up with some React components. When you go to this link, you should see something like this:

![Starting Page](https://i.imgur.com/rd0mk7F.png)

## Requirements

The investigations#show page can and should be more dynamic and interactive using React and we've already started by giving you some components to start. Looking at the starter code for investigations#show, you see that the page is simply one overarching React component, `Investigation.js`. Within that component, you already see two subcomponents, one which provides an informational overview on the investigation, and a second which provides an editable list of crimes associated with the investigation.

In order to have a great user experience, we expect the following functionality to be added to this page in the format of additional React components. Note that we are presenting them to you in order of difficulty (easiest first), but you can lay them out on the page and style them however you think most appropriate. (You have to match our content, but not our styling of components; style all these in a manner that is appropriate for your visual design.)

1. **Current Assignments:** There will be a card/panel showing the assignment of officers who are currently working on the investigation. This list will have the rank and name of the officer as well as the date the officer was assigned to the case. If there are no officers currently assigned to the investigation, a note to that effect should appear. Here's a sample of what that might look like:

   ![Assignment List](https://i.imgur.com/AYUqqpP.png)

1. **Investigation Notes:** There is a panel and/or series of cards showing notes that assigned officers have made regarding the investigation, the date the note was made, and the name of the officer making the note. Here's a sample of what that list might look like:

   ![Notes List](https://i.imgur.com/6qKV2zA.png)

   There should be an option for him/her to add a new note; rather than leave the page, the form will appear on the page with a text field for the note and `save/cancel` options. When the user enters a note and presses save, the text of the note, the current date, and the name of the user are added to the notes list and the form will then disappear. To preserve data integrity and protect justice, new notes can be created, but existing notes cannot be edited or destroyed. Here's an example of that editor in action:

   ![Notes List](https://i.imgur.com/uxIhQSp.png)

1. **Suspects History:** There will be a card/panel containing the list of suspects associated with the investigation, both the name of the criminal and the date the criminal became an official suspect. If there are no current suspects for an investigation, a note to that effect should appear. In addition, for each criminal in the suspect list, there should be some control to drop the person as a suspect; note that this will not remove them from the list, but rather set the dropped date to the current date. Here's a sample of what that might look like:

   ![Suspects List](https://i.imgur.com/OiMjBjP.png)

   Likewise, a button should be present that will allow the user to add a suspect to the investigation. Rather than leave the page, the form will appear on the page with a dropdown or autocomplete field of criminals who are active and not yet suspects and `save/cancel` options. Selecting a criminal and pressing save will update the suspect list and the form will disappear. Here's what this would look like:

   ![Suspects Editor](https://i.imgur.com/mdvEvHp.png)

   Note in this example that the main control is not a dropdown list per se, but an autocomplete field that allows us to start typing a name (as in the example above) and see that list is automatically filtered. To do this, we are using `AsyncSelect` which is a part of the `react-select` library that we have already included in the starter code. You can read more about the React Select library and how to use it in this project by going to their [home page here](https://react-select.com/home).

**Other Notes**

1. As a reminder, you are allowed and encouraged to use generative AI (Copilot, ChatGPT, Bard, and the like) to help you with your work in this phase.

   - If you use ChatGPT or Bard, please list the prompts you used in `docs/GenAI_prompts.csv` file provided. Replace the placeholders with your prompts and add new ones as needed. Only record prompts that provided useful results; failed or unfruitful prompts do not need to be recorded in this file.
   - If you use generative AI and do not provide the prompts (your way of giving appropriate credit), it will be considered an academic violation and will be passed along for disciplinary action; _providing all the prompts that helped you generate code exempts you from any disciplinary action._

1. While you are allowed to work with generative AI on your own, you are not allowed to work with other students or share code or prompts with others in any way.

1. As mentioned earlier, to populate the database with realistic data, run `rails db:populate`. As you add components, be sure to look at multiple instances of investigations#show to be sure it's working for a variety of different investigations.

1. We have provided you with an API controller for investigations that has the endpoints that you might need for this assignment. We have also given you the API routes needed in the `config/routes.rb` file.

   - Starting up the dev server with `rails server -p 3001` and then going to [http://localhost:3001/v1/investigations/1.json](http://localhost:3001/v1/investigations/1.json) or [http://localhost:3001/v1/officers.json](http://localhost:3001/v1/officers.json) will give you a sample of what these endpoints return (if it wasn't clear already).

1. You are allowed and encouraged to look that [PATS_v3 (react branch)](https://github.com/67272-App-Design-Dev/PATS_v3/tree/react) for code examples that might be helpful in this context.

1. In the `app/javascript` folder, we have already given you the `api.js` file used in PATS that helps make GET, POST, PUT, DESTROY requests to the API that include the CSRF token for Rails. If you do not use these methods, you will not be able to get or push any data as Rails will consider the request fraudulent and not respond to the request.

1. Dates, if they exist, must be formatted in the MM/DD/YY format. A component has been given to you in the starter code to assist with that. If the date is `nil`, then the date should read 'N/A'. Unformatted and/or empty dates will be penalized.
