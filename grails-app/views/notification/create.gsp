

<%@ page import="rostertracker.Notification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'notification.label', default: 'Notification')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${notificationInstance}">
            <div class="errors">
                <g:renderErrors bean="${notificationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="initiator"><g:message code="notification.initiator.label" default="Initiator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificationInstance, field: 'initiator', 'errors')}">
                                    <g:select name="initiator.id" from="${rostertracker.Player.list()}" optionKey="id" value="${notificationInstance?.initiator?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="notification.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificationInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${notificationInstance.constraints.type.inList}" value="${notificationInstance?.type}" valueMessagePrefix="notification.type" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message"><g:message code="notification.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificationInstance, field: 'message', 'errors')}">
                                    <g:textField name="message" value="${notificationInstance?.message}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
