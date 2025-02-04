<%@ page import="grails.util.Environment; org.springframework.core.SpringVersion; org.springframework.boot.SpringBootVersion"
%><!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>
<body>
<content tag="nav">
    <li class="nav-item dropdown">
        <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Application Status <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Server: ${request.getServletContext().getServerInfo()}</a></li>
            <li><a class="dropdown-item" href="#">Host: ${InetAddress.getLocalHost()}</a></li>
            <li><a class="dropdown-item" href="#">Environment: ${Environment.current.name}</a></li>
            <li><a class="dropdown-item" href="#">App version:
                <g:meta name="info.app.version"/></a>
            </li>
            <li><a class="dropdown-item" href="#">App profile: ${grailsApplication.config.getProperty('grails.profile')}</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Grails version:
                <g:meta name="info.app.grailsVersion"/></a>
            </li>
            <li><a class="dropdown-item" href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
            <li><a class="dropdown-item" href="#">JVM version: ${System.getProperty('java.version')}</a></li>
            <li><a class="dropdown-item" href="#">Spring Boot version: ${SpringBootVersion.getVersion()}</a></li>
            <li><a class="dropdown-item" href="#">Spring version: ${SpringVersion.getVersion()}</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Reloading active: ${Environment.reloadingAgentEnabled}</a></li>
        </ul>
    </li>
    <li class="nav-item dropdown">
        <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Artefacts <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
            <li><a class="dropdown-item" href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
            <li><a class="dropdown-item" href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
            <li><a class="dropdown-item" href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
        </ul>
    </li>
    <li class="nav-item dropdown">
        <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Installed Plugins<span class="caret"></span></a>
        <ul class="dropdown-menu dropdown-menu-right">
            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                <li><a class="dropdown-item" href="#">${plugin.name} - ${plugin.version}</a></li>
            </g:each>
        </ul>
    </li>
</content>

<div class="svg" role="presentation">
    <div class="bg-dark-subtle text-center">
        <asset:image src="grails-cupsonly-logo-white.svg" class="w-50"/>
    </div>
</div>

<div id="content" role="main">
    <div class="container">
        <section class="row colset-2-its">
            <div id="controllers" role="navigation">
                <h2>Available Tests:</h2>
                See console for output.
                <ul>
                    <li class="controller">
                        <g:link controller="students" action="withAnnotation">With Annotation</g:link> (( Works ))
                    </li>
                    <li class="controller">
                        <g:link controller="students" action="usingTransaction">Using Transaction</g:link> (( Works ))
                    </li>
                    <li class="controller">
                        <g:link controller="students" action="createNewSession">Create New Session</g:link> (( Works but cannot add new Employee to second-DB ))
                    </li>
                    <li class="controller">
                        <g:link controller="students" action="usingSession">Using Session</g:link> (( This will throw Exception ))
                    </li>
                    <li class="controller">
                        <g:link controller="students" action="justCallObject">Just Call The Object</g:link> (( This will throw Exception ))
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>

</body>
</html>
