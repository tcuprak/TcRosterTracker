

<%@ page import="rostertracker.PlayerGameStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playerGameStatus.label', default: 'PlayerGameStatus')}" />
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
            <g:hasErrors bean="${playerGameStatusInstance}">
            <div class="errors">
                <g:renderErrors bean="${playerGameStatusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="player"><g:message code="playerGameStatus.player.label" default="Player" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerGameStatusInstance, field: 'player', 'errors')}">
                                    <g:select name="player.id" from="${rostertracker.Player.list()}" optionKey="id" value="${playerGameStatusInstance?.player?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="game"><g:message code="playerGameStatus.game.label" default="Game" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerGameStatusInstance, field: 'game', 'errors')}">
                                    <g:select name="game.id" from="${rostertracker.Game.list()}" optionKey="id" value="${playerGameStatusInstance?.game?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="playerGameStatus.status.label" default="Player Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerGameStatusInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${playerGameStatusInstance.constraints.status.inList}" value="${playerGameStatusInstance?.status}" valueMessagePrefix="playerGameStatus.status"  />
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
