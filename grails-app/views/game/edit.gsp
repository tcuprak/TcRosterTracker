

<%@ page import="rostertracker.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gameInstance}">
            <div class="errors">
                <g:renderErrors bean="${gameInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${gameInstance?.id}" />
                <g:hiddenField name="version" value="${gameInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="game.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" precision="day" value="${gameInstance?.date}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="opponent1"><g:message code="game.opponent1.label" default="Opponent1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'opponent1', 'errors')}">
                                    <g:select name="opponent1.id" from="${rostertracker.Opponent.list()}" optionKey="id" value="${gameInstance?.opponent1?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="startTime"><g:message code="game.startTime.label" default="Start Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'startTime', 'errors')}">
                                    <g:textField name="startTime" value="${gameInstance?.startTime}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="location"><g:message code="game.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'location', 'errors')}">
                                    <g:textField name="location" value="${gameInstance?.location}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="field"><g:message code="game.field.label" default="Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'field', 'errors')}">
                                    <g:textField name="field" value="${gameInstance?.field}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weAreHomeTeam"><g:message code="game.weAreHomeTeam.label" default="We Are Home Team" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'weAreHomeTeam', 'errors')}">
                                    <g:checkBox name="weAreHomeTeam" value="${gameInstance?.weAreHomeTeam}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="result"><g:message code="game.result.label" default="Result" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'result', 'errors')}">
                                    <g:select name="result" from="${gameInstance.constraints.result.inList}" value="${gameInstance?.result}" valueMessagePrefix="game.result" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="notes"><g:message code="game.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'notes', 'errors')}">
                                    <g:textField name="notes" value="${gameInstance?.notes}" />
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
