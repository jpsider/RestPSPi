<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
		

        <!--CLARITY ICONS DEPENDENCY: CUSTOM ELEMENTS POLYFILL-->
		<link rel="stylesheet" href="components/clarity-ui-dark.min.css" title="dark" type="text/css" />
		<link rel="alternate stylesheet" href="components/clarity-ui.min.css" title="light" type="text/css"/>
        <link rel="stylesheet" href="components/clarity-icons.min.css">
        <script src="components/custom-elements.min.js"></script>
        <script src="components/clarity-icons.min.js"></script>
        <script src="components/app.js"></script>
        <script src="components/SwitchStyles.js"></script>
        <title>PES Match Maker</title>
    </head>
    <body onload="set_style_from_cookie()">
    <div class="main-container" style="margin-left:10px">
		<header class="header header-4">
			Welcome to PES Match Maker!!
        <div class="header-actions">
            <button class="btn btn-inverse" type="button" onclick="switch_style('dark');return false;" name="theme" value="Dark Theme" id="dark">Dark Theme</button>
            <button class="btn btn-inverse" type="button" onclick="switch_style('light');return false;" name="theme" value="Light Theme" id="light">Light Theme</button>
        </div>
        </header>




    