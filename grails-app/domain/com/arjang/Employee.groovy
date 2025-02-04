package com.arjang

class Employee {

    String name
    String lastname
    int employeeId
    String employeeNotes

    static constraints = {
        name nullable: true, blank: true
        lastname nullable: true, blank: true
        employeeId nullable: true, blank: true
        employeeNotes nullable: true, blank: true
    }
    static mapping = {
        datasource 'myotherdb'
        employeeNotes type: 'text'
    }


}