Feature: Manage Articles
  In order to spread the news
  As an user
  I want to create and manage articles

Scenario: Articles List
  Given I have articles titled Pizza, Breadsticks
  When I go to the list of articles
  Then I should see "Pizza"
  And I should see "Breadsticks"

Scenario: Create Valid Article
  Given I have no articles
  Given I am logged in as "admin" with password "admin"
  And I am on the list of articles
  When I follow "Novo Artigo"
  And I fill in "Titulo" with "Spuds"
  And I fill in "Corpo" with "Delicious potato wedges!"
  And I press "Salvar"
  Then I should see "Artigo criado."
  And I should see "Spuds"
  And I should see "Delicious potato wedges!"
  And I should have 1 article
