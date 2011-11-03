
<%@ page import="rostertracker.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Games</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                          <g:sortableColumn property="date" title="${message(code: 'game.date.label', default: 'Date')}" />
                        
                            <th><g:message code="game.opponent1.label" default="Opponent" /></th>
                        
                            <g:sortableColumn property="startTime" title="${message(code: 'game.startTime.label', default: 'Start Time')}" />
                        
                            <g:sortableColumn property="location" title="${message(code: 'game.location.label', default: 'Location')}" />
                        
                            <g:sortableColumn property="field" title="${message(code: 'game.field.label', default: 'Field')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${gameInstanceList}" status="i" var="gameInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        

                            <td><g:link action="show" id="${gameInstance.id}"><g:formatDate  format="MMMM dd" date="${gameInstance.date}" /></g:link></td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "opponent1")}</td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "startTime")}</td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "location")}</td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "field")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${gameInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
