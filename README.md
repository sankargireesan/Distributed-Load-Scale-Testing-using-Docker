# Distributed-Load-Scale-Testing-using-Docker

Load testing is key to the development of any backend infrastructure because load tests demonstrate how well the system functions when faced with real-world demands. An important aspect of load testing is the proper simulation of user and device behavior to identify and understand any possible system bottlenecks, well in advance of deploying applications to production.


### Getting Started

1. Create a docker image of JMeter

	```	docker build -t jmeterdocker:v1 .	```

2. Once the  build is complete, run the container in the background and launch the script file which starts jmeter inside docker

	```	docker run -d=true -i -t jmeterdocker:v1 sh launch.sh <USERNAME> <PASSWORD>	``` 


### Files
<ol>
	<li>
		<i> jmeter.properties <i> :
		Custom property file for JMeter
	</li>
	<li>
		<i>	 launch.sh <i> :
	A Shell script file which is required to invoke the JMeter inside the docker container
	</li>
	<li>
		<i>	 sample.jmx <i> :
	This is a sample .jmx file which will be used by jmeter. All the jmeter configuration for load testing is included in this file
	</li>
</ol>
