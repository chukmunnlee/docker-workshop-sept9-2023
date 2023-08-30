Packages are not upgraded to show vulnerability

trivy fs --format=sarif --output=scan.sarif --severity HIGH,CRITICAL .
