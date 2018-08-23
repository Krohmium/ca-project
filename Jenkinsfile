node('ubuntu3') {
    stage("checkout") {
        //Using the Pretested integration plugin to checkout out any branch in the ready namespace
        checkout(
            [$class: 'GitSCM', 
            branches: [[name: '*/ready/**']], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [[$class: 'CleanBeforeCheckout'], 
            pretestedIntegration(gitIntegrationStrategy: squash(), 
            integrationBranch: 'master', 
            repoName: 'origin')], 
            submoduleCfg: [], 
            userRemoteConfigs: [[credentialsId: 'krohmium-1', //remember to change credentials and url.
            url: 'git@github.com:Krohmium/ca-project.git']]])
    }
    stage("test"){
        sh 'docker container run -u "$(id -u):$(id -g)" -p 6000:5000 krohmium/ca-project-auto-build python /usr/src/ca-project/tests.py' 

    }
    stage("publish"){
        //This publishes the commit if the tests have run without errors
        pretestedIntegrationPublisher()

    }
}

