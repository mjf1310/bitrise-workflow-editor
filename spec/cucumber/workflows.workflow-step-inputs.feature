Feature: Workflow Step Inputs

  The selected Step's Inputs' properties can be viewed & some of them can be edited.

  Background:
    Given there is Workflows called ci
    And it has a Step
    And the Step has an Input
    And the Step is selected

  Scenario Outline: Input with custom opts
    Given the Input has a default <opt> in opts, in its default config
    But a custom <opt> is provided in opts, in bitrise.yml
    Then the Input's custom <opt> will be used instead of the default one

    Examples:
      | opt                   |
      | title                 |
      | category              |
      | summary               |
      | description           |
      | is don't change value |
      | is expand             |
      | is required           |
      | is sensitive          |

  Scenario: User changes Input dropdown value
    Given Input is in edit mode
    And Input has the value options opt defined with some selectable values
    When User chooses a different option from the dropdown
    Then the Input's value will be updated to that

  Scenario: Environment Variables will be replaced for Inputs with such option enabled
    Given Input is in edit mode
    And the Input has the is expand opt set to true
    Then the Environment Variables will be replaced... message will be displayed
    And during builds, all Environment Variables in the Input's value, will be replaced by their values

  Scenario: Environment Variables will be replaced for Inputs with such option disabled
    Given Input is in edit mode
    And the Input has the is expand opt set to false
    Then the Environment Variables won't be replaced... message will be displayed
    And during builds, all Environment Variables in the Input's value, will be unaltered

  Scenario: Sensitive Input with text field
    Given Input is sensitive
    And Input does not have the value options opt defined
    Then a message appears about it being sensitive
    And a link to the Secrets tab
    And a Select Secret Variable button

  Scenario: Selecting sensitive Input's text field
    Given Input is sensitive
    And Input does not have the value options opt defined
    When User selects its field
    Then the not allowed cursor is displayed
    And the Insert Variable popup appears, in secret-only mode

  Scenario: Insert Variable popup's secret-only mode
    Given the Insert Variable popup is open in secret-only mode
    And app has uploaded code signing files
    And has Secrets
    Then the create Secret section is visible
    And code signing realted Variables
    And Secrets are listed
