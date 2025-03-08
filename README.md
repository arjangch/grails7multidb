## Grails 7.0.0-M1 Issues with secondary datasource 
This project is just and example to demonstrate some issues working with secondary datasource. 

See Ticket 
- https://github.com/grails/gorm-hibernate5/issues/954

There are other similar issues but they are old.  
- https://github.com/grails/grails-core/issues/10556
- https://github.com/grails/grails-core/issues/10383

## Geb Test Errors 
Following errors happens if we run 

```
./gradlew  integrationTest
```

Generated Geb tests fails. 
```
EmployeeServiceSpec > test count FAILED
    org.spockframework.runtime.SpockComparisonFailure at EmployeeServiceSpec.groovy:53

EmployeeServiceSpec > test delete FAILED
    org.spockframework.runtime.SpockComparisonFailure at EmployeeServiceSpec.groovy:66
```
It sems that objects are not clean up from DB and accumulates. looking at xml file 
```angular2html
  <testcase name="test count" classname="com.arjang.EmployeeServiceSpec" time="0.054">
    <failure message="Condition not satisfied:&#10;&#10;employeeService.count() == 5&#10;|               |       |&#10;|               15      false&#10;&lt;com.arjang.$EmployeeServiceImplementation@7d5505a9 org_grails_datastore_mapping_services_Service__datastore=HibernateDatastore: DEFAULT&gt;&#10;" type="org.spockframework.runtime.SpockComparisonFailure">Condition not satisfied:

employeeService.count() == 5
|               |       |
|               15      false
&lt;com.arjang.$EmployeeServiceImplementation@7d5505a9 org_grails_datastore_mapping_services_Service__datastore=HibernateDatastore: DEFAULT&gt;

	at app//com.arjang.EmployeeServiceSpec.$tt__$spock_feature_0_2(EmployeeServiceSpec.groovy:53)
	at com.arjang.EmployeeServiceSpec.test count_closure3(EmployeeServiceSpec.groovy)
	at app//groovy.lang.Closure.call(Closure.java:433)
	at app//groovy.lang.Closure.call(Closure.java:422)
	at app//grails.gorm.transactions.GrailsTransactionTemplate$2.doInTransaction(GrailsTransactionTemplate.groovy:94)
	at app//org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:140)
	at app//grails.gorm.transactions.GrailsTransactionTemplate.execute(GrailsTransactionTemplate.groovy:91)
	at com.arjang.EmployeeServiceSpec.test count(EmployeeServiceSpec.groovy)
</failure>
  </testcase>
  <testcase name="test delete" classname="com.arjang.EmployeeServiceSpec" time="0.022">
    <failure message="Condition not satisfied:&#10;&#10;employeeService.count() == 5&#10;|               |       |&#10;|               15      false&#10;&lt;com.arjang.$EmployeeServiceImplementation@7d5505a9 org_grails_datastore_mapping_services_Service__datastore=HibernateDatastore: DEFAULT&gt;&#10;" type="org.spockframework.runtime.SpockComparisonFailure">Condition not satisfied:

employeeService.count() == 5
|               |       |
|               15      false
&lt;com.arjang.$EmployeeServiceImplementation@7d5505a9 org_grails_datastore_mapping_services_Service__datastore=HibernateDatastore: DEFAULT&gt;

	at app//com.arjang.EmployeeServiceSpec.$tt__$spock_feature_0_3(EmployeeServiceSpec.groovy:66)
	at com.arjang.EmployeeServiceSpec.test delete_closure4(EmployeeServiceSpec.groovy)
	at app//groovy.lang.Closure.call(Closure.java:433)
	at app//groovy.lang.Closure.call(Closure.java:422)
	at app//grails.gorm.transactions.GrailsTransactionTemplate$2.doInTransaction(GrailsTransactionTemplate.groovy:94)
	at app//org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:140)
	at app//grails.gorm.transactions.GrailsTransactionTemplate.execute(GrailsTransactionTemplate.groovy:91)
	at com.arjang.EmployeeServiceSpec.test delete(EmployeeServiceSpec.groovy)
```

