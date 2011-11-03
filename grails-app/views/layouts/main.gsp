<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Theresa Layout Title" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading Patience Please...')}" />
        </div>
        <div id="rtLogo"><a href="http://myteam.org"><img align="center" src="${resource(dir:'images',file:'MariposaEngineers.jpg')}" alt="Engineers from Mariposa" border="0" /></a></div>
        <g:layoutBody />
    </body>
</html>