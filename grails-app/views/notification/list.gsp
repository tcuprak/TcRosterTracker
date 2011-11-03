
<%@ page import="rostertracker.Notification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'notification.label', default: 'Notification')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'notification.id.label', default: 'Id')}" />
                        
                            <th><g:message code="notification.initiator.label" default="Initiator" /></th>
                        
                            <g:sortableColumn property="type" title="${message(code: 'notification.type.label', default: 'Type')}" />
                        
                            <g:sortableColumn property="message" title="${message(code: 'notification.message.label', default: 'Message')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${notificationInstanceList}" status="i" var="notificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${notificationInstance.id}">${fieldValue(bean: notificationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: notificationInstance, field: "initiator")}</td>
                        
                            <td>${fieldValue(bean: notificationInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: notificationInstance, field: "message")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${notificationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
