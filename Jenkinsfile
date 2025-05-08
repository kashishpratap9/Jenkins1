pipeline{
  agent any
    environment{
      IMAGE_NAME="my_py_app"
      CONTAINER_NAME="my_py_container"
    }
    stages{
      stage('clone'){
        steps{
          git branch:'main' , url:'https://github.com/kashishpratap9/Jenkins1.git'
        }
      }
      stage('Build'){
        steps{
          script{
            sh "docker build -t $IMAGE_NAME ."
          }
        }
      }
      stage('Run'){
        steps{
          script{
            sh "docker rm -f $CONTAINER_NAME || true"
            sh "docker run -d --name $CONTAINER_NAME -p 5000:5000 $IMAGE_NAME"
          }
        }
      }
    }

    post{
      success{
        echo "successfull go to http://localhost:5000"
      }
      failure{
        echo "failed"
      }
    }
}