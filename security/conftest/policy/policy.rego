package main

denylist = [ "apk" ]

deny[msg] {
	input[i].Cmd = "from"
	val = input[i].Value
	contains(val[_], ":latest" )
	msg = sprintf("Cannot use :latest tag %s", [ val ])
}

deny[msg] {
	input[i].Cmd = "from"
	val = input[i].Value
	no_imagetag = [ t | contains(val[_], ":"); t = 1]
	count(no_imagetag) <= 0
	msg = sprintf("Add a tag to the FROM image %s", [ val ])
}

deny[msg] {
	input[i].Cmd = "run"
	val = input[i].Value
	contains(val[_], denylist[_])
	msg = sprintf("Command not allowed %s", [ val ])
}

deny[msg] {
	without_labels = [ l | input[i].Cmd = "label"; l = 1 ]
	count(without_labels) <= 0
	msg = "Add LABEL the Dockerfile"
}

deny[msg] {
	without_healthcheck = [ hc | input[i].Cmd = "healthcheck"; hc := 1 ]
	count(without_healthcheck) <= 0
	msg = "Image must include HEALTHCHECK"
}
