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
             
            /* stage(' SonarQube analysis')
                                         {
                              steps {
                                    withSonarQubeEnv('Sonarqube') {
                                         bat 'mvn sonar:sonar -Dsonar.projectKey=self -Dsonar.host.url=http://localhost:9000 -Dsonar.login=4dbae951ce004a29ed598247d70e1d982241113d'
                                           }
                                      }
                                   }
               
                          stage('Deploy to artifactory'){
                                steps{
                                       bat 'mvn deploy'
                                      }
                                     }*/
                        stage('Building image') {
                           steps{
                              script {
                                   dockerImage= docker.build registry + ":$BUILD_NUMBER"
                                     }
                                }
                               }
                       stage('Push image to dockerhub') {
                           steps{
                                    bat "docker push vkgarg/vinit:%BUILD_NUMBER%"
                                    }
                               }
        
              
                      stage('Deploy to tomcat'){
                                 steps{
                                       bat "copy target\\second_mvn.war \"C:\\Users\\vinitgarg\\apache-tomcat-8.5.51\\webapps\""                                   
                                }
                                   }
                      stage('Deploy to localhost'){
                         steps{  
                                 bat "docker rm -f second_mvn"
                                 bat "docker run -d --name second_mvn -p 80:8080 vkgarg/vinit:%BUILD_NUMBER%"
                         }
                      }
         
            
              
     }
}
