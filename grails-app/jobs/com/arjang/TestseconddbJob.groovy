package com.arjang

class TestseconddbJob {
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        def myemployee = Employee.list()
        log.info "---myemployee-size--"+myemployee.size()
        new Employee(name: "dodo", lastname: "mini").save()
    }
}
