echo "START Running Jmeter on `date`"

mv /opt/apache-jmeter-4.0/jmeter.properties /opt/apache-jmeter-4.0/bin/jmeter.properties

sh bin/jmeter.sh -n -t smp.jmx  -l log.jtl -Jtenant=$1 -Jkey=$2