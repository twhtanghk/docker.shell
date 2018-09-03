#!/bin/bash

vpncmd 127.0.0.1 /SERVER /PASSWORD:$SPW /CMD ServerCertSet /LOADCERT:server.crt /LOADKEY:server.key
vpncmd 127.0.0.1 /SERVER /HUB:DEFAULT /PASSWORD:$HPW /CMD CAAdd ca.crt
