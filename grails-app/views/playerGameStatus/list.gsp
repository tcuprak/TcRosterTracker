
<%@ page import="rostertracker.PlayerGameStatus"%>
<%@ page import="rostertracker.Game"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="pageName" value="Player Availability" />

<title><g:message code="default.list.label" args="[pageName]" />
</title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /> </a> </span> <span class="menuButton"></span>
	</div>
	
	<div class="body">
		<h1>Who's Coming?</h1>
		<%--  Display error if exists --%>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>

		<%--  Start of my table --%>

		<div class="list">
			<table>
				<thead>
					<tr>
						<th></th>

						<g:each in="${gameInstanceList}" status="gameIndex" var="nextGame">


							<th><g:formatDate format="MMMM dd" date="${nextGame.date}" />
								</th>

						</g:each>
					</tr>
					<tr>
						<g:sortableColumn property="id"
							title="${message(code: 'player.id.label', default: 'Player')}" />

						<g:each in="${gameInstanceList}" status="gameIndex" var="nextGame">


							<th>${nextGame.startTime}</th>

						</g:each>
					</tr>
					

				</thead>
				<tbody>
				<%--  save number of players --%>
				<g:set var="numPlayers" value="${playerInstanceList.count}" />
					<g:each in="${playerInstanceList}" status="playerIndex"
						var="nextPlayer">
						<tr class="${(playerIndex % 2) == 0 ? 'odd' : 'even'}">

							<td><g:link action="showplayer" id="${nextPlayer.id}">${fieldValue(bean: nextPlayer, field: "firstName")} ${fieldValue(bean: nextPlayer, field: "lastName")}</g:link></td>
							<g:each in="${gameInstanceList}" status="gameIndex"
								var="nextGame">



								<%-- loop over each game and get the status for this player for this game, then add to select box to let user pick --%>


								<%-- TODO inline code here TBD figure out how to call this method using tags --%>
								<%  def foundStatus = PlayerGameStatus.findByPlayerAndGame(nextPlayer, nextGame) %>

								<%--  filename that matches status spelling is the icon we select --%>
								<g:set var="filename" value="${foundStatus?.status}.png" />
								
								<%--  populate the drop down with all of the available status choices --%>
								<td><small><small><small><small><g:select name="foundStatus.status"
										from="${foundStatus?.constraints?.status?.inList}"
										value="${foundStatus?.status}" /> </small></small></small></small>
								<img
									src="${resource(dir:'images', file:filename)}"
									alt="${filename}" border="0" />
							</td>
							</g:each>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>


		<div class="paginateButtons">
			<g:paginate total="${playerInstanceList.count}" />
		</div>
	</div>
</body>
</html>
