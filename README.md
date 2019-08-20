# grafana-npm-go-image
Dockerfile to build grafana image


to build image

docker build -t monicashinde3/golang-npm-grafana .



To run the conatiner 

docker run -dit --name grafana-container -p3000:3000 monicashinde3/golang-npm-grafana
