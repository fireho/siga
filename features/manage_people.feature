Feature: Manage People
  In order to govern the city
  As an employee
  I want to create and manage people

Scenario: People List
  Given I have people named Shadow, Ramon
  And I am logged in as "admin" with password "admin"
  When I go to the list of people
  Then I should see "Shadow"
  And I should see "Ramon"

Scenario: Create Valid Person
  Given I have no people
  Given I am logged in as "admin" with password "admin"
  And I am on the list of people
  When I follow "Novo Registro"
  And I fill in "Nome" with "Santos Dummont"
  And I choose "Masculino"
  And I press "Salvar"
  Then I should see "Registro criado."
  And I should see "Santos Dummont"
  And I should see "Masculino"
  And I should have 1 person

Scenario: Try to Create a invalid Person
  Given I have no people
  Given I am logged in as "admin" with password "admin"
  And I am on the list of people
  When I follow "Novo Registro"
  And I press "Salvar"
  Then I should not see "Registro criado."
  But I should see "Nome*não pode ser vazio"
  And I fill in "Nome" with "Santos Dummont"
  And I choose "Masculino"
  And I press "Salvar"
  Then I should see "Registro criado."
  And I should see "Santos Dummont"
  And I should see "Masculino"
  And I should have 1 person

Scenario: Edit a Person
  Given I am logged in as "admin" with password "admin"
  And I am on the list of people
  When I follow "Novo Registro"
  And I fill in "Nome" with "Santos Dummont"
  And I choose "Masculino"
  And I press "Salvar"