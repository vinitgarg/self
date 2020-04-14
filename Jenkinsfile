pipeline{
   agent any
tools{
     maven 'Maven'
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
                                       bat 'mvn clean install'
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
                                      rtServer (id: 'Artifactory',url: 'http://localhost:8081/artifactory',username: 'admin',password: 'password')
                                      rtUpload (serverId: 'Artifactory',spec: '''{"files": [{ "pattern": "/**.war","target": "maven_artifact/"}]}''')
                                      }
                                     }
   
              
              stage('Deploy to tomcat'){
                                steps{
                                       bat "copy target\\second_mvn.war \"C:\\Users\\vinitgarg\\apache-tomcat-8.5.51\\webapps\""                                     }
                                   }
                                 }
}
