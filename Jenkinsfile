
node {
  //cleanWs()

    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository
        checkout scm
    }

    stage('Build') {
        // Run the maven build
        if (isUnix()) {
           sh 'docker run -i -u "$(id -u):$(id -g)" -v maven-repo:/root/.m2 -v $PWD:/usr/src/mymaven -w /usr/src/mymaven --rm maven:3-jdk-8 mvn clean test install'
            //sh "mvn -Dmaven.test.failure.ignore clean package"
            stash name: "build-result", includes: "target/**"
  
        }
    }

//    stage('Push'){
//        pretestedIntegrationPublisher()

//        deleteDir()
//    }
  }
  node {  
    stage('test'){
//          unstash 'repo'
//          unstash 'build-result'
        sh 'docker container run -u "$(id -u):$(id -g)" -p 5000:5000 -v $PWD:/usr/src/ca-project -w /usr/src/ca-project --rm "python test.py" krohmium/codechan 

//          sh 'docker run -u "$(id -u):$(id -g)" -v maven-repo:/root/.m2 -v $PWD:/usr/src/mymaven -w /usr/src/mymaven --rm maven:3-jdk-8 mvn site'
    }
//    stage('Results') {
//            junit '**/target/surefire-reports/TEST-*.xml'
//            archiveArtifacts 'target/*.jar'
       
//    }
}
