package com.arjang

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class HelpersServiceSpec extends Specification implements ServiceUnitTest<HelpersService> {

     void "test something"() {
        expect:
        service.doSomething()
     }
}
