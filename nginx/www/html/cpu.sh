#!/bin/sh
echo "Content-type: text/html"
echo ""

CPU_LOAD=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15}')

echo "<html>"
echo "<head>"
echo "<title>CPU Load</title>"
echo "<meta http-equiv='refresh' content='2'>"
echo "
    <style>
        html {
            color-scheme: light dark;
        }

        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
"
echo "</head>"
echo "<body>"
echo "<h1>Current CPU Load: $CPU_LOAD%</h1>"
echo "</body>"
echo "</html>"
