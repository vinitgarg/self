pipeline{
   agent any
tools{
     maven 'Maven'
   }
     environment {
    registry = "vkgarg/vinit"
    registryCredential = 'Docker'
     }

 
   stages {

              stage("Code Checkout") {
                                steps {
                                       git url: 'https://github.com/vinitgarg/self.git'
                                      }
                                     }
              stage('Build Stage') {
                               steps{
                                        bat 'mvn package'
                                     }
                                    }
              stage('Compile Stage'){
                                steps{
                                       bat 'mvn compile'
                                      }
                                     }
              stage('Testing Stage'){
                                steps{
                                      bat 'mvn test'
                                     } 
                                    }
             stage(' SonarQube analysis')
                                         {
                              steps {
                                    withSonarQubeEnv('Sonarqube') {
                                         bat 'mvn sonar:sonar'
                                           }
                                      }
                                   }
               
                          stage('Deploy artifact'){
                                steps{
                                       bat 'mvn deploy'
                                      }
                                     }
   
              
              stage('Deploy to tomcat'){
                                steps{
                                       bat "copy target\\second_mvn.war \"C:\\Users\\vinitgarg\\apache-tomcat-8.5.51\\webapps\""                                   
                                }
                                   }
             stage('Building image') {
                           steps{
                              script {
                                   dockerImage= docker.build registry + ":$BUILD_NUMBER"
                                     }
                                }
                               }
  
              stage('Deploy Image') {
                           steps{
                                script {
                                     docker.withRegistry( '', registryCredential ) {
                                     dockerImage.push()
                                             }
                                          }
                                    }
                               }
       
     }
}
