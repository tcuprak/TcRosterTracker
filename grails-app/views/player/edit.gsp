

<%@ page import="rostertracker.Player" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Updating ${playerInstance?.firstName} </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${playerInstance}">
            <div class="errors">
                <g:renderErrors bean="${playerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${playerInstance?.id}" />
                <g:hiddenField name="version" value="${playerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="player.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${playerInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="player.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${playerInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="player.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${playerInstance.constraints.status.inList}" value="${playerInstance?.status}" valueMessagePrefix="player.status"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone"><g:message code="player.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${playerInstance?.phone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="player.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${playerInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="playerNotes"><g:message code="player.playerNotes.label" default="Player Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'playerNotes', 'errors')}">
                                    <g:textArea name="playerNotes" cols="40" rows="5" value="${playerInstance?.playerNotes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateJoined"><g:message code="player.dateJoined.label" default="Date Joined" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'dateJoined', 'errors')}">
                                    <g:datePicker name="dateJoined" precision="month" value="${playerInstance?.dateJoined}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birthday"><g:message code="player.birthday.label" default="Birthday" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'birthday', 'errors')}">
                                    <g:datePicker name="birthday" precision="day" value="${playerInstance?.birthday}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
