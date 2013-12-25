package com.jpos

import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured  // for ver 2.0-RC2

@Secured(value=["hasRole('ROLE_ADMIN')"])
class McustomerController {

    static scaffold = true
}
