
<%@ page import="rostertracker.Player" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
        <title>Team Roster</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Team Roster</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="firstName" title="${message(code: 'player.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'player.lastName.label', default: 'Last Name')}" />

                            <g:sortableColumn property="status" title="${message(code: 'player.status.label', default: 'Status')}" />
                           <g:sortableColumn property="birthday" title="${message(code: 'player.birthday.label', default: 'Birthday')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playerInstanceList}" status="i" var="playerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${playerInstance.id}">${fieldValue(bean: playerInstance, field: "firstName")}</g:link></td>
                            <td>${fieldValue(bean: playerInstance, field: "lastName")}</td>


                            <td>${fieldValue(bean: playerInstance, field: "status")}</td>
                            <td>${fieldValue(bean: playerInstance, field: "email")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${playerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
