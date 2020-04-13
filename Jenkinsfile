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
                                       bat 'mvn clean compile'
                                      }
                                     }
              stage('Testing Stage'){
                                steps{
                                      bat 'mvn test'
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
                                       bat "copy target\\second_mvn.war \'C:\\Users\\vinitgarg\\apache-tomcat-8.5.51\\webapps'"
                                     }
                                   }
             
                                 }
}
