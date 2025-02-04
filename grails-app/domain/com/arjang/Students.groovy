package com.arjang

class Students {

    String name
    String lastname
    int studentId

    static constraints = {
        name nullable: true, blank: true
        lastname nullable: true, blank: true
        studentId nullable: true, blank: true
    }
    static mapping = {
    }
}