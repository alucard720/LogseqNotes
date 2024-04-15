- 1. IIS publish path : C:\Build
  2. backup path : C:\Jenkins Automation\Backup
  3. SQL Backup path: C:\Jenkins Automation\SQLBackup
  pipeline t
  agent any
  stages (
  stage ('checkout latest From IFS') {
  stage ('Build And Deployment') (
  steps i
  bat "C:\\Users\\Ramanareddy\\Desktop\\Test.bat Senv.chooseEnvironment No"
  stage ('Testing') {
  steps (
  script (
  userConfigInput - input (id: 'userConfigInput',
  message: 'Do You Have Config Changes...!',
  parameters: [
  [$class: 'ChoiceParameterDefinition', choices: "Yes\nNo", name: 'ConfigChanges']
  ])
  echo " User input 13: $(userConfigInput) "
  echo "If you have any testcases to automate.............!"
  stage ('Database Deployment') (
  steng {}