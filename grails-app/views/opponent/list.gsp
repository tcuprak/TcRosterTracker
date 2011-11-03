
<%@ page import="rostertracker.Opponent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'opponent.label', default: 'Opponent')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Opponents</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                          <g:sortableColumn property="name" title="${message(code: 'opponent.name.label', default: 'Name')}" />
                          <g:sortableColumn property="notes" title="${message(code: 'opponent.notes.label', default: 'Notes')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${opponentInstanceList}" status="i" var="opponentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${opponentInstance.id}">${fieldValue(bean: opponentInstance, field: "name")}</g:link></td>                      
                            <td>${fieldValue(bean: opponentInstance, field: "notes")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${opponentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
