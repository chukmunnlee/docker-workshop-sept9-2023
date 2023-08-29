package main

denylist = [ "apt" ]

# Cannot use latest tag
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

# Cannot run commands from denylist
deny[msg] {
	input[i].Cmd = "run"
	val = input[i].Value
	contains(val[_], denylist[_])
	msg = sprintf("Command not allowed %s", [ val ])
}

# Dockerfile must include the following commands
warn[msg] {
	count(has_cmd("label")) <= 0
	msg = "Add LABEL the Dockerfile"
}

deny[msg] {
	count(has_cmd("healthcheck")) <= 0
	msg = "Image must include HEALTHCHECK"
}

has_cmd(cmd) = cmd_array {
	cmd_array := [ c | input[i].Cmd = cmd; c = input[i] ]
}
