
<%@ page import="rostertracker.Player" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Player</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.firstName.label" default="First Name" /></td>

                            <td valign="top" class="value">${fieldValue(bean: playerInstance, field: "firstName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.lastName.label" default="Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: playerInstance, field: "lastName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: playerInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.phone.label" default="Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: playerInstance, field: "phone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: playerInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.playerNotes.label" default="Player Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: playerInstance, field: "playerNotes")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.dateJoined.label" default="Date Joined" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${playerInstance?.dateJoined}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="player.birthday.label" default="Birthday" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MMMM dd, yyyy" date="${playerInstance?.birthday}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${playerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
