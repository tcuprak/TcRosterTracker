
<%@ page import="rostertracker.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${gameInstance?.date}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.opponent1.label" default="Opponent" /></td>
                            
                            <td valign="top" class="value"><g:link controller="opponent" action="show" id="${gameInstance?.opponent1?.id}">${gameInstance?.opponent1?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.startTime.label" default="Start Time" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "startTime")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.location.label" default="Location" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "location")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.field.label" default="Field" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "field")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.weAreHomeTeam.label" default="We Are Home Team" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${gameInstance?.weAreHomeTeam}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.result.label" default="Result" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "result")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.notes.label" default="Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "notes")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${gameInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
