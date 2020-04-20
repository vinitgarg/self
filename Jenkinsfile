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
                                         bat 'mvn sonar:sonar -Dsonar.projectKey=self -Dsonar.host.url=http://localhost:9000 -Dsonar.login=8c037913ed1d0323d84690f5bba8d3ae44802621'
                                           }
                                      }
                                   }
               
                          stage('Deploy artifact'){
                                steps{
                                       bat 'mvn deploy'
                                      }
                                     }
                        stage('Building image') {
                           steps{
                              script {
                                   dockerImage= docker.build registry + ":$BUILD_NUMBER"
                                     }
                                }
                               }
                       stage('Push image to dockerhub') {
                           steps{
                                script {
                                     docker.withRegistry( '', registryCredential ) {
                                     dockerImage.push()
                                             }
                                          }
                                    }
                               }
        
              
                      stage('Deploy to tomcat'){
                                 steps{
                                       bat "copy target\\second_mvn.war \"C:\\Users\\vinitgarg\\apache-tomcat-8.5.51\\webapps\""                                   
                                }
                                   }
                      stage('Deploy to localhost'){
                         steps{  
                                 bat "docker run -p 80:8080 :$BUILD_NUMBER"
                         }
                      }
         
            
              
     }
}
