package com.arjang

import grails.gorm.transactions.Transactional
import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
@Transactional(readOnly = false, connection = "myotherdb")
class EmployeeServiceSpec extends Specification {

    EmployeeService employeeService
    SessionFactory sessionFactory

    private Long setupData() {
        new Employee(name: "joe", lastname: "Mian", employeeId: 123456, employeeNotes: "hello").save(flush: true, failOnError: true)
        new Employee(name: "joe", lastname: "Mian", employeeId: 123456, employeeNotes: "hello").save(flush: true, failOnError: true)
        Employee employee = new Employee(name: "joe", lastname: "Mian", employeeId: 123456, employeeNotes: "hello").save(flush: true, failOnError: true)
        new Employee(name: "joe", lastname: "Mian", employeeId: 123456, employeeNotes: "hello").save(flush: true, failOnError: true)
        new Employee(name: "joe", lastname: "Mian", employeeId: 123456, employeeNotes: "hello").save(flush: true, failOnError: true)
        employee.id
    }

    void "test get"() {
        setupData()

        expect:
        employeeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Employee> employeeList = employeeService.list(max: 2, offset: 2)

        then:
        employeeList.size() == 2
    }

    /**
     * Fails because
     * employeeService.count() == 5
     |               |       |
     |               16      false
     */
    void "test count"() {
        setupData()

        expect:
        employeeService.count() == 5
    }

    /**
     * fails because
     * employeeService.count() == 5
     |               |       |
     |               16      false
     */
    void "test delete"() {
        Long employeeId = setupData()

        expect:
        employeeService.count() == 5

        when:
        employeeService.delete(employeeId)
        sessionFactory.currentSession.flush()

        then:
        employeeService.count() == 4
    }

    void "test save"() {
        when:
        Employee employee = new Employee(name: "joe", lastname: "Mian", employeeId: 123456, employeeNotes: "hello")
        employeeService.save(employee)

        then:
        employee.id != null
    }
}
