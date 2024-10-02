[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/unLuMC3q)
# 67-272: GCPD Project - Phase 4

We will continue our project to develop a foundation for the GCPD Crime Tracking system in this phase. We will focus our efforts on building out the controllers and views to make for an effective front end for our new system, including some dynamic pages using React. This is a lot a test-driven development in this phase -- we give you all the controller tests and some view tests and your job is to pass these tests. In this process, you will see how our testing suite can serve as documentation and help us define system requirements.

**Grading**

This phase will constitute 17 percent of your final course grade and is broken down into the following four components:

1. **Creation of Controllers**: We have given you all the controller tests that your controllers must pass. (_Note that in this section, when we talk of controllers, we are excluding all API controllers._) Of course, these controllers must also be able to generate the code needed to pass the Cucumber tests, so reading the two sets of tests together is advisable. All tests must pass and the coverage is to be at 100 percent; if you add additional methods that we do not test, expect a substantial penalty. The project must be **using Rails 7.0.4 and Ruby 3.1.4 and the gems specified in the Gemfile.**. In total, the creation of controllers and passing those tests compromise 30 points.

2. **Creation of Views**: We are going to have you complete key elements of the system front end by building views for units, officers, and the like. (_Note that in the interest of time, we are not requiring views for every single model and controller._) We have given you a series of 10 Cucumber tests that test the full stack (model-view-controller) for key views; these will help you learn a bit about this form of testing. In building these views, keep in mind design principles that were discussed in class. In total, passing the Cucumber tests counts for 30 points of the phase grade.

3. **Dynamic UI with React**: The investigations#show page has a lot of potential to be more interactive with the use of React. In a separate file in the docs/ directory, we have more information about what we are requiring for this page and how we expect React to be utilized. In total, creating the dynamic investigations#show page will be worth 30 points.

4. **Visual Design & Design Principles**: To prevent attempts to hack the test suites, we will be manually checking each application to make sure that the key elements are not hard-coded into the response. While doing that, we will also assess the quality of your visual design. In addition to an assessment of your visual design, we may deduct points in this section for not adhering to design principles discussed in class. In total, this section is worth 10 points.

**Checkpoints**

There are two checkpoints for this phase.

1. On **March 31st**, the controllers for `units`, `officers`, `crimes`, `criminals`, `investigations` and `sessions`, must be complete and passing all tests at 100 percent coverage. In addition, the controller tests for handling 404 errors must also pass.

2. On **April 7th**, in addition to the previous checkpoint working, all remaining controllers must be complete and passing at 100 percent coverage. Additionally, the Cucumber tests (features 0-4) must pass.

All checkpoints are due in your GitHub repository before 11:59pm on the date specified. We are not explicitly checking for test coverage on checkpoints, only that the specified tests exist and they pass. Checkpoints will be submitted via GitHub and Gradescope (additional instructions to follow).

**Other Notes**

1. There are no spec files given with regards to controller code this phase -- part of the purpose of this phase is to get you familiar with testing as a form of documentation. **Because of this, if you ask a general question about requirements on Piazza or in office hours, our first response will be to ask you what the tests tell you.** If you have specific questions about the tests and how they work, we are happy to answer those, _but we will not interpret the tests for you -- it's your job to turn those tests into requirements._

1. We have given you a reasonable testing context that can be easily set up with the command: `rails db:contexts`. Note that the autograder will have a tweaked version of the context with slightly different names, prices, and the like, to try to discourage students from hard-coding the responses.

1. Note that the models we've given you are feature complete and no additional methods are needed to complete this phase. That said, we have also given you a few extra methods that were not part of the previous, so reviewing the models would be helpful. If you do feel compelled to add new methods to your models, you are responsible for writing tests for those methods so the coverage remains at 100 percent.

1. We strongly advise you _NOT_ to use `rails generate scaffold ...` but rather `rails generate controller ...` in creating your controller for this phase. (Or even better, just use `touch <filename>` on the command line to generate blank files to work with.) Also, be sure not to overwrite the controller tests if you do use the generators. Be forewarned: scaffolding will generate lots of extra code that may inadvertently impact your test coverage and cause you to lose points. We will have no sympathy if you ignore this warning and lose points.

1. We do expect authorization to be put in place at both the controller and view levels, as appropriate. There will be penalties if authorization is not handled properly at the controller or view levels.

1. Doing the checkpoints will keep you from getting too far behind, **but _only_ doing the minimum each week will pretty much ensure a miserable final week.** Our advice, as it has been throughout the semester, is to follow the path but work ahead of the minimum requirements.

**Turning in Phase 4**

Your project should be turned in via your private repository on GitHub **before 11:59 pm on Sunday, April 21th, 2024**. Once it's in your repo, you will then submit it from there to Gradescope. More instructions on submitting to the autograder will be posted separately. The solution for this phase (i.e., starter code for the next phase) will be released soon after; no late assignments will be accepted after solutions are released.

Again, if you have questions regarding the turn-in of this project or problems downloading any of the materials below, please post them on Piazza or ask someone well in advance of the turn-in date. Waiting until the day before it is due to get help is unwise -- you risk not getting a timely response that close to the deadline and will not be given an extension because of such an error.
